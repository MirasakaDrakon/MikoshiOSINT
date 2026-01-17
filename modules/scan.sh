#!/bin/bash
echo "NetScan by Drak0n"
echo "-=[NetScan]=-"

red(){ printf "\033[1;31m$1\033[0m\n"; }

red ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
red ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⢰⡆⢘⣆⠀⠀⡆⠀⢸⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
red ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⣆⣧⡤⠾⢷⡚⠛⢻⣏⢹⡏⠉⣹⠟⡟⣾⠳⣼⢦⣀⣰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
red ⠀⠀⠀⠀⠀⠀⠀⠰⣄⡬⢷⣝⢯⣷⢤⣘⣿⣦⣼⣿⣾⣷⣼⣽⣽⣿⣯⡾⢃⣠⣞⠟⠓⢦⣀⠆⠀⠀⡀⠀⠀⠀⠀⠀⠀
red ⠀⠀⠀⠀⠲⣄⣤⣞⡉⠛⢶⣾⡷⠟⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⡿⢿⡛⠻⠿⣥⣤⣶⠞⠉⢓⣤⡴⢁⠄⠀⠀⠀⠀⠀
red ⠀⠀⠀⣄⣠⠞⠉⢛⣻⡿⠛⠁⠀⣸⠯⠈⠀⠁⣴⣿⣿⣿⡶⠤⠽⣇⠈⣿⠀⠀⠈⠙⠻⢶⣾⣻⣭⠿⢫⣀⣴⡶⠃⠀⠀
red ⠀⢤⣀⣜⣉⣩⣽⠿⠋⠀⠀⠀⠀⣿⠈⠀⠀⢸⣿⣿⣿⣿⣀⠀⠀⠸⠇⢸⡇⠀⠀⠀⠀⠀⠘⠛⢶⣶⣾⣻⡯⠄⠀⣠⠄
red ⠀⠤⠬⢭⣿⣿⠋⠀⠀⠀⠀⠀⠀⢻⡀⠀⠀⠀⢿⣿⣿⣿⡿⠋⠁⠀⠀⣼⠁⠀⠀⠀⠀⠀⢀⣴⣫⣏⣙⠛⠒⠚⠋⠁⠀
red ⡔⢀⡵⠋⢧⢹⡀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⣠⣾⣿⡛⠛⠛⠓⠦⠀⠀⠀⠀
red ⣇⠘⠳⠦⠼⠧⠷⣄⣀⠀⠀⠀⠀⠀⠀⠳⢤⣀⠀⠀⠀⠀⠀⢀⣠⠾⠃⠀⠀⠀⣀⣴⣻⣟⡋⠉⠉⢻⠶⠀⠀⠀⠀⠀⠀
red ⠈⠑⠒⠒⠀⠀⢄⣀⡴⣯⣵⣖⣦⠤⣀⣀⣀⠉⠙⠒⠒⠒⠚⠉⢁⣀⣠⢤⣖⣿⣷⢯⡉⠉⠙⣲⠞⠁⠀⠀⠀⠀⠀⠀⠀
red ⠀⠀⠀⠀⠀⠀⠀⠈⠙⠣⢤⡞⠉⢉⡿⠒⢻⢿⡿⠭⣭⡭⠿⣿⡿⠒⠻⣯⡷⡄⠉⠳⣬⠷⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
red ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠺⠤⣄⣠⡏⠀⠀⡿⠀⠀⠘⡾⠀⢀⣈⡧⠴⠒⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
red ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠒⠓⠒⠒⠚⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

cat <<WRN
LIST OF SUBNETS:

[192.168.0.0/24] – Home routers (common default)
[192.168.1.0/24] – Home routers (most popular worldwide)
[192.168.2.0/24] – ISP-provided routers (Alt/Default)
[192.168.3.0/24] – Xiaomi / TP-Link alt LAN
[192.168.8.0/24] – Huawei mobile routers
[192.168.10.0/24] – Small office networks
[192.168.43.0/24] – Android Hotspot
[192.168.137.0/24] – Windows Hotspot / ICS
[192.168.100.0/24] – Cable modems, fiber ONTs
[192.168.254.0/24] – Legacy routers / ISP internal

[10.0.0.0/24] – Apple Airport routers
[10.0.1.0/24] – macOS / Airport default LAN
[10.1.0.0/16] – Corporate environments
[10.10.0.0/16] – Office & enterprise networks
[10.20.0.0/16] – VPN networks
[10.8.0.0/24] – OpenVPN (default)
[10.9.0.0/24] – OpenVPN alternative
[10.128.0.0/16] – ISP internal routing
[10.254.0.0/16] – Internal server infrastructure

[172.16.0.0/24] – Corporate LANs
[172.17.0.0/16] – Docker default network
[172.18.0.0/16] – Docker additional networks
[172.19.0.0/16] – Kubernetes clusters
[172.20.10.0/28] – iPhone Hotspot
[172.31.0.0/16] – AWS / Cloud networks
[172.30.0.0/16] – VPN services

[100.64.0.0/10] – Mobile LTE/5G CGNAT (Carrier NAT)
[100.72.0.0/16] – Mobile operator internal
[100.96.0.0/16] – ISP CGNAT
[100.127.0.0/24] – Edge CGNAT nodes

[169.254.0.0/16] – APIPA (DHCP failure)

[127.0.0.0/8] – Localhost loopback
[127.0.0.1/32] – Standard loopback

[192.0.2.0/24] – TEST-NET-1 (documentation only)
[198.51.100.0/24] – TEST-NET-2
[203.0.113.0/24] – TEST-NET-3

[198.18.0.0/15] – Network device testing (firewalls, IPS)
[192.168.122.0/24] – QEMU/KVM default NAT
[192.168.240.0/20] – VMware NAT
[192.88.99.0/24] – Deprecated 6to4 relay
[224.0.0.0/4] – Multicast (routing protocols)
[240.0.0.0/4] – Reserved, experimental
WRN
echo " "
HOSTS=(
    "8.8.8.8:Google DNS"
    "8.8.4.4:Google DNS"
    "1.1.1.1:Cloudflare DNS"
    "1.0.0.1:Cloudflare DNS"
    "208.67.222.222:OpenDNS"
    "208.67.220.220:OpenDNS"
    "9.9.9.9:Quad9 DNS"
    "149.112.112.112:Quad9 DNS"
    "192.168.1.1:LAN Router"
    "192.168.0.1:LAN Router"
    "10.0.0.1:LAN Router"
)

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

declare -A STATUS
declare -A CATEGORY
declare -A PING_TIME

lan_active=false
lan_host=""

for host_info in "${HOSTS[@]}"; do
    IFS=":" read -r host name <<< "$host_info"
    CATEGORY["$host"]="$name"
    output=$(ping -c 1 -w 1 "$host" 2>/dev/null)
    if [[ $? -eq 0 ]]; then
        time_ms=$(echo "$output" | grep -oP 'time=\K[0-9.]+')
        PING_TIME["$host"]="${time_ms}ms"
        if (( $(echo "$time_ms > 300" | bc -l) )); then
            STATUS["$host"]="BAD SIGNAL"
        else
            STATUS["$host"]="OK"
            if [[ "$name" == "LAN Router" ]]; then
                lan_active=true
                lan_host="$host"
            fi
        fi
    else
        STATUS["$host"]="FAILED"
        PING_TIME["$host"]="[-]"
    fi
done

if $lan_active; then
    for host_info in "${HOSTS[@]}"; do
        IFS=":" read -r host name <<< "$host_info"
        if [[ "$name" == "LAN Router" && "$host" != "$lan_host" ]]; then
            STATUS["$host"]="NONE"
            PING_TIME["$host"]="[-]"
        fi
    done
fi

success=0
for host in "${!STATUS[@]}"; do
    if [[ "${STATUS[$host]}" == "OK" ]]; then
        ((success++))
    fi
done
total=${#HOSTS[@]}
percent=$(( success * 100 / total ))

BAR_WIDTH=40
filled=$(( (success * BAR_WIDTH) / total ))
empty=$(( BAR_WIDTH - filled ))
progress="["
for ((i=0;i<filled;i++)); do progress+="#"; done
for ((i=0;i<empty;i++)); do progress+="-"; done
progress+="] $percent%"

if [[ $success -eq $total ]]; then
    COLOR=$GREEN
elif [[ $success -gt 0 ]]; then
    COLOR=$YELLOW
else
    COLOR=$RED
fi

for host_info in "${HOSTS[@]}"; do
    IFS=":" read -r host name <<< "$host_info"
    case "${STATUS[$host]}" in
        OK) color=$GREEN ;;
        BAD\ SIGNAL) color=$YELLOW ;;
        FAILED) color=$RED ;;
        NONE) color=$RED ;;
    esac
    echo -e "${color}SIGNAL $host (${CATEGORY[$host]} - ${STATUS[$host]}) [${PING_TIME[$host]}]${NC}"
done

if [[ $success -eq $total ]]; then
    echo -e "${GREEN}SIGNAL ESTABLISHED ${progress}${NC}"
elif [[ $success -gt 0 ]]; then
    echo -e "${YELLOW}SIGNAL APPROX. ${progress}${NC}"
else
    echo -e "${RED}SIGNAL NOT ESTABLISHED ${progress}${NC}"
fi

echo "=== NetScan ULTIMATE ==="
echo "Select scan target type:"
echo "0) Exit"
echo "1) Local Network"
echo "2) Scan IP / URL"
echo "3) Traceroute"
echo "4) Whois"
echo "5) Reverse DNS"
echo "6) DirBuster"
echo "7) SQLMap"
read -rp "Enter choice (0 to 7): " TARGET_TYPE

SUBNET=""
TARGET_HOST=""

auto_detect_subnet_no_root() {
    if command -v ip >/dev/null 2>&1; then
        cidr=$(ip -o -4 addr show scope global 2>/dev/null | awk '{print $4; exit}')
        if [[ -n "$cidr" ]]; then
            echo "$cidr"
            return 0
        fi
        ipaddr=$(ip -4 addr show 2>/dev/null | awk '/inet / && $2!~/127/ {print $2; exit}')
        if [[ -n "$ipaddr" ]]; then
            if [[ "$ipaddr" == *"/"* ]]; then
                echo "$ipaddr"
            else
                IFS='.' read -r a b c d <<< "$ipaddr"
                echo "${a}.${b}.${c}.0/24"
            fi
            return 0
        fi
    fi
    if command -v ifconfig >/dev/null 2>&1; then
        ipaddr=$(ifconfig 2>/dev/null | awk '/inet / && $2!~/127/ {print $2; exit}')
        if [[ -n "$ipaddr" ]]; then
            ipaddr=${ipaddr##*:}
            IFS='/' read -r addr prefix <<< "$ipaddr"
            if [[ -n "$prefix" ]]; then
                echo "$addr/$prefix"
            else
                IFS='.' read -r a b c d <<< "$addr"
                echo "${a}.${b}.${c}.0/24"
            fi
            return 0
        fi
    fi
    if command -v getprop >/dev/null 2>&1; then
        for iface in wlan0 eth0 rmnet0 wlan1; do
            ipaddr=$(getprop "dhcp.$iface.ipaddress" 2>/dev/null)
            if [[ -n "$ipaddr" && "$ipaddr" != "0.0.0.0" ]]; then
                IFS='.' read -r a b c d <<< "$ipaddr"
                echo "${a}.${b}.${c}.0/24"
                return 0
            fi
        done
    fi
    commons=("192.168.1.1" "192.168.0.1" "10.0.0.1" "192.168.43.1")
    for gw in "${commons[@]}"; do
        if ping -c 1 -W 1 "$gw" &>/dev/null; then
            IFS='.' read -r a b c d <<< "$gw"
            echo "${a}.${b}.${c}.0/24"
            return 0
        fi
    done
    echo ""
    return 1
}

if [[ "$TARGET_TYPE" == "0" ]]; then
  exit
elif [[ "$TARGET_TYPE" == "1" ]]; then
    DETECTED_SUBNET=$(auto_detect_subnet_no_root)
    read -rp "Enter subnet to scan (press Enter to use detected: ${DETECTED_SUBNET:-none}): " SUBNET
    read -rp "Enter port range(default 1-1024): " ports
    ports="${ports:-1-1024}"

    if [[ -z "$SUBNET" ]]; then
        if [[ -z "$DETECTED_SUBNET" ]]; then
            echo "No subnet detected and none provided. Exiting."
            exit 1
        else
            SUBNET="$DETECTED_SUBNET"
        fi
    fi
elif [[ "$TARGET_TYPE" == "2" ]]; then
    read -rp "Enter IP or URL to scan: " TARGET_HOST
    read -rp "Enter port range(default 1-1024): " ports
    ports="${ports:-1-1024}"
    if [[ -z "$TARGET_HOST" ]]; then
        echo "No target provided. Exiting."
        exit 1
    fi
    echo "Checking if $TARGET_HOST is reachable..."
    if ! ping -c 1 -W 2 "$TARGET_HOST" &>/dev/null; then
        read -rp "Warning: Host did not respond to ping. Continue scan? (y/n): " CONTINUE_SCAN
        if [[ ! "$CONTINUE_SCAN" =~ ^[Yy]$ ]]; then
            echo "Exiting."
            exit 1
        fi
    fi
elif [[ "$TARGET_TYPE" == "3" ]];
  then
    read -rp "Enter IP or domain for traceroute: " TARGET_HOST
        if [[ -z "$TARGET_HOST" ]]; then
            echo "No target provided. Exiting."
            exit 1
        fi
        echo "Traceroute for $TARGET_HOST:"
        traceroute "$TARGET_HOST"
        exit 0
elif [[ "$TARGET_TYPE" == "4" ]];
  then
    read -rp "Enter IP or domain for WHOIS: " TARGET_HOST
        if [[ -z "$TARGET_HOST" ]]; then
            echo "No target provided. Exiting."
            exit 1
        fi
        echo "WHOIS for $TARGET_HOST:"
        whois "$TARGET_HOST"
        exit 0
        echo "Invalid choice. Exiting."
        exit 1
elif [[ "$TARGET_TYPE" == "5" ]];
  then
    read -rp "Enter IP for Reverse DNS: " ip

    echo "=== dig ==="
    dig -x "$ip"

    echo "=== host ==="
    host "$ip"

    echo "=== nslookup ==="
    nslookup "$ip"

    echo "=== Done ==="
    exit 0
elif [[ "$TARGET_TYPE" == "6" ]];
  then
    read -rp "Enter IP/URL for DirBuster: " ip
    echo "=== STARTING DIRBUSTER ==="
    dirb "$ip"
    exit 0
elif [[ "$TARGET_TYPE" == "7" ]];
   then
     read -rp "Enter IP/URL for SQLMap: " ip
     echo "=== STARTING SQLMAP ==="
     sqlmap -u "$ip " --level=5 --risk=3 
     exit 0
else
    echo "Invalid choice. Exiting."
    exit 1
fi

read -rp "Enable --packet-trace? (y/n): " TRACE_CHOICE
PACKET_TRACE=false
if [[ "$TRACE_CHOICE" =~ ^[Yy]$ ]]; then
    PACKET_TRACE=true
fi

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while kill -0 "$pid" 2>/dev/null; do
        for i in $(seq 0 3); do
            printf "\rScanning... ${spinstr:i:1}"
            sleep $delay
        done
    done
    printf "\rScan complete!     \n"
}

if [[ "$TARGET_TYPE" == "1" ]]; then
    echo "=== Scanning active hosts in $SUBNET ==="
    ACTIVE_HOSTS=$(nmap -sn "$SUBNET" | grep "Nmap scan report" | awk '{print $5}')
    if [ -z "$ACTIVE_HOSTS" ]; then
        echo "No active hosts found!"
        exit 1
    fi
    echo "Found active hosts:"
    echo "$ACTIVE_HOSTS"
    echo "=== Scanning hosts for open ports & vulners ==="
    for ip in $ACTIVE_HOSTS; do
        echo "Scanning $ip..."
        if $PACKET_TRACE; then
            nmap -A -sT -sV --reason -p "$ports" --script=vulners,vuln --packet-trace "$ip"
        else
            nmap -A -sT -sV --reason -p "$ports" --script=vulners,vuln "$ip" &
            PID=$!
            spinner $PID
            wait $PID
        fi
    done
else
    echo "=== Scanning $TARGET_HOST for open ports & vulners ==="
    if $PACKET_TRACE; then
        nmap -A -sT -sV --reason  -p "$ports" --script=vulners,vuln --packet-trace "$TARGET_HOST"
    else
        nmap -A -sT -sV --reason  -p "$ports" --script=vulners,vuln "$TARGET_HOST" &
        PID=$!
        spinner $PID
        wait $PID
    fi
fi

echo "=== Scan complete ==="
