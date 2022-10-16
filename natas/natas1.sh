#!/bin/sh

level="natas1"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth -sL $url -vv 2>&1 | grep "password for natas2" | cut -d " " -f 6)
echo -n "[+] Password for the next level: $next_password\n"
echo "natas2:$next_password" >> ./credentials
