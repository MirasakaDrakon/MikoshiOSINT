# creepy_converter.py

alphabet = {
    "Й": "Ū",
    "Ц": "Ц",
    "У": "Y",
    "К": "k",
    "Е": "3",
    "Н": "H",
    "Г": "Г",
    "Ш": "Ш",
    "Щ": "Щ",
    "З": "3",
    "Х": "X",
    "Ф": "Ф",
    "Ы": "bI",
    "В": "B",
    "А": "a",
    "П": "n",
    "Р": "P",
    "О": "0",
    "Л": "Л",
    "Д": "Д",
    "Ж": "Ж",
    "Э": "Э",
    "Я": "R",
    "Ч": "4",
    "С": "C",
    "М": "M",
    "И": "u",
    "Т": "T",
    "Ь": "b",
    "Б": "6",
    "Ю": "Ю",
}

def creepy_text(text: str) -> str:
    result = []
    for ch in text:
        upper = ch.upper()
        if upper in alphabet:
            rep = alphabet[upper]
            if len(rep) == 1:
                result.append(rep if ch.isupper() else rep.lower())
            else:
                result.append(rep)  # НЕ трогаем bI, Ū и т.п.
        else:
            result.append(ch)
    return "".join(result)

if __name__ == "__main__":
    text = input("ENTER TEXT: ")
    print("Creepy:", creepy_text(text))
