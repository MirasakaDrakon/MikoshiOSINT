center() {
    local cols
    cols=$(tput cols)
    while IFS= read -r line; do
        local len=${#line}
        local pad=$(( (cols - len) / 2 ))
        (( pad < 0 )) && pad=0
        printf "%*s%s\n" "$pad" "" "$line"
    done
}

menu=(
"1. IP Analysis(IProbiv)"
"2. Base64 payload generator"
"3. Account search(Sherlock)"
"4. Creepy text generator(Only russian text)"
"5. Net scanning tools(NetScan)"
"6. Email check(holehe)"
"7. Phone number lookup"
"8. File metadata read"
"9. Image EXIF Metadata wipe"
"10. Hash cracker"
"11. File risk scanner"
"12. Manuals"
"0. Exit"
)

while true; do
    clear
    # Заголовок ASCII
    center << 'EOF'
ooo        ooooo  o8o  oooo                           oooo         o8o  
`88.       .888'  `"'  `888                           `888         `"'  
 888b     d'888  oooo   888  oooo   .ooooo.   .oooo.o  888 .oo.   oooo  
 8 Y88. .P  888  `888   888 .8P'   d88' `88b d88(  "8  888P"Y88b  `888  
 8  `888'   888   888   888888.    888   888 `"Y88b.   888   888   888  
 8    Y     888   888   888 `88b.  888   888 o.  )88b  888   888   888  
o8o        o888o o888o o888o o888o `Y8bod8P' 8""888P' o888o o888o o888o 
                                                                        
                                                                        
                                                                        
  .oooooo.    .oooooo..o ooooo ooooo      ooo ooooooooooooo             
 d8P'  `Y8b  d8P'    `Y8 `888' `888b.     `8' 8'   888   `8             
888      888 Y88bo.       888   8 `88b.    8       888                  
888      888  `"Y8888o.   888   8   `88b.  8       888                  
888      888      `"Y88b  888   8     `88b.8       888                  
`88b    d88' oo     .d8P  888   8       `888       888                  
 `Y8bood8P'  8""88888P'  o888o o8o        `8      o888o                 
                                                                        
                                                                        
                                                                        
EOF

    # Пункты меню
    for item in "${menu[@]}"; do
        echo "$item"
    done | center

    # Ввод пользователя
    echo
    read -p "Select option: " choice

    case $choice in
        1)
            clear
            python3 modules/iprobiv.py
            read -p "Press Enter to return to menu..."
            ;;
        2)
            clear
            python3 modules/base64_paygen.py         
            read -p "Press Enter to return to menu..."
            ;;
        3)
            clear
            read -p "Enter nick: " nick
            sherlock $nick
            read -p "Press Enter to return to menu..."
            ;;
        4)
            clear
            python3 modules/doxbin_text_converter.py      
            read -p "Press Enter to return to menu..."
            ;;
        5)
            clear
            bash modules/scan.sh      
            read -p "Press Enter to return to menu..."
            ;;
        6)
            clear
            read -p "Enter email: " email
            holehe $email
            read -p "Press Enter to return to menu..."
            ;;
        7)
            clear
            python3 modules/phone.py
            read -p "Press Enter to return to menu..."
            ;;
        8)
            clear
            python3 modules/exifread.py
            read -p "Press Enter to return to menu..."
            ;;
        9)
            clear
            python3 modules/exifclean.py
            read -p "Press Enter to return to menu..."
            ;;
        10)
            clear
            python3 modules/hashcrack.py
            read -p "Press Enter to return to menu..."
            ;;
        11)
            clear
            read -p "Enter VirusTotal API key: " key
            read -p "Enter file path: " file
            export VT_API_KEY="$key"
            python3 modules/fileriskscanner.py $file
            read -p "Press Enter to return to menu..."
            ;;
        12)
            clear
            bash modules/manuals.sh
            read -p "Press Enter to return to menu..."
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option!"
            sleep 1
            ;;
    esac
done
