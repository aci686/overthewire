#!/bin/sh

level="natas8"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo -n "[i] Target: $url\n"
encoded_secret=$(curl -u $web_auth -sL $url/index-source.html | html2markdown | grep "encodedSecret = " | cut -d " " -f 3 | sed "s/[\";]//g")
secret=$(echo $(echo $(echo $encoded_secret | xxd -r -p) | rev) | base64 -d)
next_password=$(curl -u $web_auth -X POST -d "secret=$secret&submit=Submit" -sL $url | grep "natas9" | cut -d " " -f 8)
echo -n "[+] Password for the next level: $next_password"
echo "natas9:$next_password" >> ./credentials
