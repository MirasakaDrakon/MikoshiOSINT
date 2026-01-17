#!/bin/bash

MANUALS="manuals"

ANONYMITY=("ANONYM.txt" "ANONYM2.txt")
DOX=("PHONE_DOX.txt" "dox.txt" "PHOTO_DNN.txt" "FACE_SEARCH.txt" "DEF_DNN.txt" "VK_SEARCH.txt" "TG_DNN_ID.txt")
SWATING=("SWAT.txt" "SWAT2.txt")
OSINT=("OSINT_RESOURCES.txt" "OSINT_BOTS.txt")

clear
echo "DISCLAIMER/ДИСКЛЕЙМЕР!
ДАННЫЙ МАТЕРИАЛ ПРЕДНАЗНАЧЕН ИСКЛЮЧИТЕЛЬНО
ДЛЯ ОБУЧЕНИЯ, ЦИФРОВОЙ ГИГИЕНЫ И ЗАЩИТЫ ПРИВАТНОСТИ.

Он описывает типовые модели угроз и ошибки пользователей.
Использование информации для незаконной деятельности недопустимо."
echo "THIS MATERIAL IS INTENDED EXCLUSIVELY
FOR EDUCATIONAL PURPOSES, DIGITAL HYGIENE,AND PRIVACY PROTECTION.
It describes common threat models and typical user mistakes.
The information is provided to help understand risks and improve personal security awareness.
Any use of this material for illegal, unethical, or harmful activities is strictly prohibited."

echo "The manuals has been taked from unofficial sources / Мануалы были взяты из неофициальных источников"

echo "===== MANUAL CATEGORIES ====="
echo "1) ANONYMITY"
echo "2) DOX"
echo "3) SWATING"
echo "4) OSINT"
echo "0) Exit"
echo
read -p "Select category: " cat

case $cat in
  1) FILES=("${ANONYMITY[@]}");;
  2) FILES=("${DOX[@]}");;
  3) FILES=("${SWATING[@]}");;
  4) FILES=("${OSINT[@]}");;
  0) exit 0;;
  *) echo "Invalid category"; exit 1;;
esac

clear
echo "===== MANUALS ====="

i=1
for f in "${FILES[@]}"; do
  echo "[$i] $f"
  ((i++))
done
echo "[0] Back"
echo
read -p "Select manual: " choice

[[ "$choice" == "0" ]] && exit 0

index=1
for f in "${FILES[@]}"; do
  if [[ "$index" == "$choice" ]]; then
    clear
    echo "===== $f ====="
    echo
    less "$MANUALS/$f"
    exit 0
  fi
  ((index++))
done

echo "Invalid selection"