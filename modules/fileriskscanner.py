#!/usr/bin/env python3
# FindTheMole v0.2
# Deep static analysis + heuristic malware detection + optional AV API
# Author: MikoshiOSINT

import os
import sys
import math
import zipfile
import string
import hashlib
import mimetypes
import subprocess
import json
from collections import Counter
from io import BytesIO

# ---------------------------
# Optional libraries
# ---------------------------
try:
    import exifread
except:
    exifread = None

try:
    import requests
except:
    requests = None

# ---------------------------
# Utils
# ---------------------------

def read_bytes(path, limit=1024 * 1024):
    with open(path, "rb") as f:
        return f.read(limit)

def entropy(data):
    if not data:
        return 0.0
    c = Counter(data)
    total = len(data)
    return -sum((v / total) * math.log2(v / total) for v in c.values())

def printable_ratio(data):
    if not data:
        return 0.0
    printable = sum(1 for b in data if chr(b) in string.printable)
    return printable / len(data)

def file_hashes(path):
    hashes = {}
    with open(path, "rb") as f:
        data = f.read()
        hashes["md5"] = hashlib.md5(data).hexdigest()
        hashes["sha1"] = hashlib.sha1(data).hexdigest()
        hashes["sha256"] = hashlib.sha256(data).hexdigest()
    return hashes

# ---------------------------
# Name & format checks
# ---------------------------

def check_name(path, findings):
    name = os.path.basename(path)
    if name.count(".") >= 2:
        findings.append(("name", "double extension", 20))
    if name.startswith("."):
        findings.append(("name", "hidden file", 5))
    if any(c in name for c in ["\u200b", "\u202e"]):
        findings.append(("name", "unicode spoofing (RTL)", 30))

def check_magic(path, findings):
    data = read_bytes(path, 4096)
    ext = os.path.splitext(path)[1].lower()

    magic = {
        b"\x50\x4B\x03\x04": "zip",
        b"\xFF\xD8\xFF": "jpg",
        b"\x89PNG": "png",
        b"\x25PDF": "pdf",
        b"\x7FELF": "elf",
        b"MZ": "exe"
    }

    detected = None
    for sig, t in magic.items():
        if data.startswith(sig):
            detected = t

    if detected and detected not in ext:
        findings.append(("magic", f"extension mismatch ({detected})", 25))

# ---------------------------
# Embedded / tail data
# ---------------------------

def check_embedded(path, findings):
    data = read_bytes(path)
    if b"PK\x03\x04" in data[128:]:
        findings.append(("embed", "embedded ZIP detected", 30))
    if b"MZ" in data[128:]:
        findings.append(("embed", "embedded EXE detected", 40))

def check_tail_data(path, findings):
    try:
        with open(path, "rb") as f:
            f.seek(-512, os.SEEK_END)
            tail = f.read()
        if b"PK\x03\x04" in tail or b"MZ" in tail:
            findings.append(("tail", "hidden data at EOF", 35))
    except:
        pass

# ---------------------------
# Entropy & stego
# ---------------------------

def check_entropy(path, findings):
    data = read_bytes(path)
    e = entropy(data)
    if e > 7.5:
        findings.append(("entropy", f"high entropy ({e:.2f})", 25))

def check_stego(path, findings):
    data = read_bytes(path)
    ratio = printable_ratio(data)
    size = os.path.getsize(path)

    if ratio < 0.2:
        findings.append(("stego", "binary-heavy content", 10))
    if size > 5_000_000 and ratio < 0.15:
        findings.append(("stego", "possible steganography", 25))

# ---------------------------
# Metadata
# ---------------------------

def check_metadata(path, findings):
    if not exifread:
        return
    try:
        with open(path, "rb") as f:
            tags = exifread.process_file(f, details=False)
        if "GPS GPSLatitude" in tags:
            findings.append(("meta", "GPS data present", 15))
        if "Image Software" in tags:
            findings.append(("meta", f"software: {tags['Image Software']}", 5))
    except:
        pass

# ---------------------------
# Archives & Office
# ---------------------------

def check_archive(path, findings):
    if zipfile.is_zipfile(path):
        try:
            with zipfile.ZipFile(path) as z:
                for i in z.infolist():
                    if i.flag_bits & 0x1:
                        findings.append(("archive", "password protected file", 20))
                        break
        except:
            findings.append(("archive", "corrupted archive", 15))

def check_office_macros(path, findings):
    if not zipfile.is_zipfile(path):
        return
    try:
        with zipfile.ZipFile(path) as z:
            for name in z.namelist():
                if "vbaProject.bin" in name:
                    findings.append(("office", "VBA macros detected", 40))
    except:
        pass

# ---------------------------
# Strings
# ---------------------------

def check_strings(path, findings):
    data = read_bytes(path)
    buf = b""
    strings_found = []

    for b in data:
        if 32 <= b <= 126:
            buf += bytes([b])
        else:
            if len(buf) > 8:
                strings_found.append(buf.decode(errors="ignore"))
            buf = b""

    keywords = [
        "powershell", "cmd.exe", "bash -c", "base64",
        "curl ", "wget ", "nc ", "python -c"
    ]

    for s in strings_found:
        for k in keywords:
            if k in s.lower():
                findings.append(("strings", f"suspicious string: {k}", 20))
                return

# ---------------------------
# Binary (PE / ELF)
# ---------------------------

def check_pe_elf(path, findings):
    data = read_bytes(path, 2048)

    if data.startswith(b"MZ"):
        findings.append(("binary", "PE executable detected", 20))
        if b".text" not in data:
            findings.append(("binary", "packed or stripped PE", 25))

    if data.startswith(b"\x7FELF"):
        findings.append(("binary", "ELF executable detected", 20))
        if b".symtab" not in data:
            findings.append(("binary", "stripped ELF", 20))

# ---------------------------
# VirusTotal API (hash-based)
# ---------------------------

def vt_lookup(sha256):
    if not requests:
        return None
    api_key = os.getenv("VT_API_KEY")
    if not api_key:
        return None

    url = f"https://www.virustotal.com/api/v3/files/{sha256}"
    headers = {"x-apikey": api_key}

    try:
        r = requests.get(url, headers=headers, timeout=15)
        if r.status_code != 200:
            return None
        data = r.json()
        return data["data"]["attributes"]["last_analysis_stats"]
    except:
        return None

# ---------------------------
# Core scanner
# ---------------------------

def scan_file(path):
    findings = []

    try:
        check_name(path, findings)
        check_magic(path, findings)
        check_embedded(path, findings)
        check_tail_data(path, findings)
        check_entropy(path, findings)
        check_stego(path, findings)
        check_metadata(path, findings)
        check_archive(path, findings)
        check_office_macros(path, findings)
        check_strings(path, findings)
        check_pe_elf(path, findings)

        hashes = file_hashes(path)
        vt = vt_lookup(hashes["sha256"])
        if vt and vt.get("malicious", 0) > 0:
            findings.append(("av", f"VT malicious detections: {vt['malicious']}", 50))

    except Exception as e:
        findings.append(("error", str(e), 0))

    return findings

# ---------------------------
# Output
# ---------------------------

def risk_level(score):
    if score >= 70:
        return "HIGH"
    if score >= 40:
        return "MEDIUM"
    return "LOW"

def scan_path(path):
    if os.path.isfile(path):
        files = [path]
    else:
        files = []
        for root, _, names in os.walk(path):
            for n in names:
                files.append(os.path.join(root, n))

    for f in files:
        print("\n---", f)
        findings = scan_file(f)
        score = sum(x[2] for x in findings)

        for t, msg, pts in findings:
            print(f"[!] {t}: {msg} (+{pts})")

        print(f"[=] SCORE: {score} | RISK: {risk_level(score)}")

# ---------------------------
# Main
# ---------------------------

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: FindTheMole <file_or_folder>")
        sys.exit(1)

    scan_path(sys.argv[1])