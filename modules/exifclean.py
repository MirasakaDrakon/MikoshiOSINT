import piexif
from PIL import Image
import random
import datetime
import os

# ---------- RANDOM DATA ----------

CAMERAS = [
    ("Canon", "EOS 80D"),
    ("Nikon", "D750"),
    ("Sony", "ILCE-7M3"),
    ("Samsung", "SM-G991B"),
    ("Xiaomi", "Mi 11")
]

SOFTWARE = [
    "Adobe Photoshop",
    "Lightroom",
    "GIMP",
    "Snapseed",
    "VSCO"
]

def random_datetime():
    start = datetime.datetime(2015, 1, 1)
    end = datetime.datetime(2024, 12, 31)
    delta = end - start
    return (start + datetime.timedelta(seconds=random.randint(0, int(delta.total_seconds())))) \
        .strftime("%Y:%m:%d %H:%M:%S")

def random_gps():
    lat = random.uniform(-80, 80)
    lon = random.uniform(-170, 170)

    def to_dms(val):
        d = int(abs(val))
        m = int((abs(val) - d) * 60)
        s = int((((abs(val) - d) * 60) - m) * 60 * 100)
        return [(d,1), (m,1), (s,100)]

    return {
        piexif.GPSIFD.GPSLatitudeRef: "N" if lat >= 0 else "S",
        piexif.GPSIFD.GPSLatitude: to_dms(lat),
        piexif.GPSIFD.GPSLongitudeRef: "E" if lon >= 0 else "W",
        piexif.GPSIFD.GPSLongitude: to_dms(lon)
    }

# ---------- MAIN CLEANER ----------

def sanitize_image(path):
    img = Image.open(path)

    # Полное удаление старого EXIF
    clean_img = Image.new(img.mode, img.size)
    clean_img.putdata(list(img.getdata()))

    # Рандомные EXIF
    make, model = random.choice(CAMERAS)

    exif_dict = {
        "0th": {
            piexif.ImageIFD.Make: make,
            piexif.ImageIFD.Model: model,
            piexif.ImageIFD.Software: random.choice(SOFTWARE)
        },
        "Exif": {
            piexif.ExifIFD.DateTimeOriginal: random_datetime(),
            piexif.ExifIFD.LensMake: make,
            piexif.ExifIFD.LensModel: model
        },
        "GPS": random_gps(),
        "1st": {},
        "thumbnail": None
    }

    exif_bytes = piexif.dump(exif_dict)

    out = "cleaned_" + os.path.basename(path)
    clean_img.save(out, "jpeg", exif=exif_bytes, quality=95)

    print(f"[+] Saved sanitized image: {out}")

# ---------- RUN ----------

if __name__ == "__main__":
    path = input("Enter the path to the photo: ").strip()
    sanitize_image(path)