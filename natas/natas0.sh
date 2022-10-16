#!/bin/sh

level="natas0"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth -sL $url | grep "natas1" | cut -d " " -f 6)
echo -n "[+] Password for the next level: $next_password"
echo -n "natas1:$next_password" >> ./credentials