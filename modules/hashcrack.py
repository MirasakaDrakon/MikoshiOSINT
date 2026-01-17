import hashlib
import requests
from hashid import HashID
from pathlib import Path

HASH_BY_LENGTH = {
    32:  ["md5"],
    40:  ["sha1"],
    64:  ["sha256"],
    128: ["sha512"]
}

def identify_hash(hash_value):
    print("\n[*] Hash identification:")
    try:
        results = HashID().identifyHash(hash_value)
        for h in results:
            print(" -", h.name)
    except Exception:
        print(" - Unknown")

def get_algorithms(hash_value):
    return HASH_BY_LENGTH.get(len(hash_value), [])

# -------- API ANALYSIS --------
def api_analysis(hash_value):
    print("\n[*] API analysis started")

    urls = [
        f"https://api.hashlookup.com/{hash_value}",
        f"https://lea.kz/api/hash/{hash_value}"
    ]

    for url in urls:
        try:
            r = requests.get(url, timeout=10)
            if r.status_code == 200 and r.text.strip():
                print(f"\n[+] Result from {url}:")
                print(r.text)
                return
        except Exception:
            pass

    print("[-] API lookup failed")

# -------- WORDLIST BRUTEFORCE --------
def wordlist_bruteforce(hash_value):
    algos = get_algorithms(hash_value)

    if not algos:
        print("[-] Unsupported hash length")
        return

    wordlist = input("Enter wordlist path: ").strip()
    path = Path(wordlist)

    if not path.exists():
        print("[!] Wordlist not found")
        return

    print(f"\n[*] Algorithms: {', '.join(algos)}")
    print(f"[*] Wordlist : {path}")

    with open(path, "r", errors="ignore") as f:
        for word in f:
            word = word.strip()
            for algo in algos:
                h = hashlib.new(algo, word.encode()).hexdigest()
                if h == hash_value:
                    print("\n[+] HASH CRACKED")
                    print(f" Algorithm: {algo}")
                    print(f" Password : {word}")
                    return

    print("[-] Not found in wordlist")

# -------- MAIN --------
def run_hash_analyzer():
    hash_value = input("\nEnter hash: ").strip().lower()

    identify_hash(hash_value)

    print("\n[1] API Analysis")
    print("[2] Wordlist bruteforce")

    choice = input("Select option: ").strip()

    if choice == "1":
        api_analysis(hash_value)
    elif choice == "2":
        wordlist_bruteforce(hash_value)
    else:
        print("[!] Invalid option")

if __name__ == "__main__":
    run_hash_analyzer()