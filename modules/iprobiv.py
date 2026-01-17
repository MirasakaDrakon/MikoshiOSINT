import requests
from rich.console import Console
from rich.table import Table

console = Console()
ip = input("Enter IP: ")

# Источники с исправленным endpoint для ip-api.com
sources = {
    "ipinfo.io": f"https://ipinfo.io/{ip}",
    "ipwho.is": f"https://ipwho.is/{ip}?security=1",
    "ip2location.io": f"https://api.ip2location.io/?ip={ip}",
    "ip-api.com": f"http://ip-api.com/json/{ip}?fields=66846719",
    "ipwhois.io": f"https://ipwhois.app/json/{ip}",
    "ipapi.co": f"https://ipapi.co/{ip}/json/",
    "api.db-ip.com": f"https://api.db-ip.com/v2/free/{ip}",
}

# Ключевые поля для OSINT

keys = [
    # Основные поля IP
    "ip", "ipAddress", "query", "version", "network",

    # Гео-данные
    "city", "city_name",
    "region", "regionName", "region_name", "stateProv", "stateProvCode", "region_code", "district",
    "country", "countryName", "country_name",
    "country_code", "countryCode", "country_code_iso3",
    "continent", "continentName", "continent_code", "continentCode",
    "latitude", "longitude", "lat", "lon","loc",
    "postal", "zip", "zip_code",
    "timezone", "timezone_name", "utc_offset", "offset",
    "in_eu","country_tld",

    # Организация и ASN
    "org", "as", "isp", "asn", "asname", "domain", "hostname", "reverse",
    
    # Связь и флаги
    "calling_code", "country_calling_code", "country_flag", "flag", "anycast","country_phone",
    
    # Валюта и языки
    "currency", "currency_name", "currency_code", "currency_symbol", "currency_plural",
    "languages",
    
    # Время
    "timezone_dstOffset","timezone_gmtOffset","timezone_gmt",
    
    # Дополнительно
    "mobile", "proxy", "hosting", "success", "type", "message", "readme", "current_time", "country_area", "country_population", "borders", "capital","is_eu","currency_rates"
]

def format_value(value):
    """Преобразует словари в красивую строку"""
    if isinstance(value, dict):
        return ", ".join(f"{k}:{v}" for k, v in value.items())
    return str(value)

for name, url in sources.items():
    console.rule(f"[bold green]{name}[/bold green]")
    try:
        r = requests.get(url, timeout=10)
        r.raise_for_status()
        try:
            data = r.json()
        except ValueError:
            console.print(r.text)
            continue

        table = Table(show_header=True, header_style="bold magenta")
        table.title = name
        table.add_column("Field", style="cyan")
        table.add_column("Value", style="yellow")

        for key in keys:
            value = data.get(key)

            # ищем в вложенных словарях
            if value is None:
                for sub in ["connection", "timezone", "flag"]:
                    if sub in data and key in data[sub]:
                        value = data[sub][key]

            if value is not None:
                table.add_row(key, format_value(value))

        console.print(table)

    except Exception as e:
        console.print(f"[red]Ошибка при запросе {name}: {e}[/red]")