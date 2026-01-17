import shutil
import os
import re
import phonenumbers
from phonenumbers import (
    geocoder, carrier, timezone,
    NumberParseException,
    PhoneNumberType,
    PhoneNumberFormat
)

def clean_number(raw: str) -> str:
    return re.sub(r"[^\d+]", "", raw)

def format_number_type(num_type):
    mapping = {
        PhoneNumberType.FIXED_LINE: "Fixed line",
        PhoneNumberType.MOBILE: "Mobile",
        PhoneNumberType.FIXED_LINE_OR_MOBILE: "Fixed/Mobile",
        PhoneNumberType.TOLL_FREE: "Toll free",
        PhoneNumberType.PREMIUM_RATE: "Premium rate",
        PhoneNumberType.SHARED_COST: "Shared cost",
        PhoneNumberType.VOIP: "VOIP",
        PhoneNumberType.PAGER: "Pager",
        PhoneNumberType.UAN: "UAN",
        PhoneNumberType.UNKNOWN: "Unknown"
    }
    return mapping.get(num_type, "Unknown")

def generate_links(e164: str):
    phone = e164.replace("+", "")
    return {
        "WhatsApp": f"https://wa.me/{phone}",
        "Telegram": f"https://t.me/+{phone}",
        "Telegram (tg://)": f"tg://resolve?phone={phone}",
        "Viber": f"https://viber.click/{phone}",
        "Viber (app)": f"viber://chat?number=+{phone}"
    }

def run():
    print(" Phone OSINT Lookup\n")
    raw_input = input("Enter phone number (any format): ").strip()
    cleaned = clean_number(raw_input)

    try:
        num = phonenumbers.parse(cleaned, None)
    except NumberParseException:
        print(" Invalid phone number")
        return

    print("\n------------------------------")
    print(f" Raw input: {raw_input}")
    print(f" Parsed   : {num}")

    valid = phonenumbers.is_valid_number(num)
    possible = phonenumbers.is_possible_number(num)

    print(f"├ Valid   : {valid}")
    print(f"├ Possible: {possible}")

    region = geocoder.description_for_number(num, "en")
    oper = carrier.name_for_number(num, "en")
    num_type = phonenumbers.number_type(num)
    tz = timezone.time_zones_for_number(num)

    e164 = phonenumbers.format_number(num, PhoneNumberFormat.E164)

    print(f"├ Country/Region: {region or 'Unknown'}")
    print(f"├ Carrier       : {oper or 'Unknown'}")
    print(f"├ Type          : {format_number_type(num_type)}")
    print(f"├ Time Zone(s)  : {', '.join(tz) if tz else 'Unknown'}")

    print("\n Formats:")
    print(f"├ E164          : {e164}")
    print(f"├ International : {phonenumbers.format_number(num, PhoneNumberFormat.INTERNATIONAL)}")
    print(f"├ National      : {phonenumbers.format_number(num, PhoneNumberFormat.NATIONAL)}")

    print("\n Messenger links:")
    links = generate_links(e164)
    for k, v in links.items():
        print(f"├ {k}: {v}")

    # Socialscan (если установлен)
    if shutil.which("socialscan"):
        print("\n Socialscan:")
        os.system(f"socialscan phone {e164}")
    else:
        print("\n socialscan not installed")

    input("\nPress Enter to exit...")

if __name__ == "__main__":
    run()