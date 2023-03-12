#!/bin/bash

level="natas11"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

urldecode() {
    : "${*//+/ }";
    echo -e "${_//%/\\x}";
}

asc() {
    printf "%d" "'$1";
}

hextodec() {
    printf "%d" "0x$1";
}

xor_encrypt() {
    echo "[i] Calling xor_encrypt with $1 and $2"
    for (( i=0; i < ${#2}; i++ )); do
        v1=$(asc "${2:$i:1}")
        v2=$(asc "${1:$(( i % ${#1} )):1}")
        v3=$((v1^v2))
        out+=$(printf "%02x" "$v3")
    done
    printf "%s" "$out"
}

echo "[i] Target: $url"
cookiee=$(curl -u $web_auth -sL $url -I | grep "Cookie" | cut -d "=" -f 2 | sed 's/\r$//g')
cookie=$(urldecode $cookiee)
defaultdata=$(curl -u $web_auth -sL $url/index-source.html | html2markdown | grep "#ffffff" | tr -d " " | sed 's/$defaultdata=array(/{/g' | sed 's/);/}/g')
xor_encrypt $defaultdata $cookie
next_password=""
echo -n "[+] Password for the next level: $next_password"
echo "natas12:$next_password" >> ./credentials
