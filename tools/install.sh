#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
trap 'echo; echo "Aborting due to error on line $LINENO. Exit code: $?" >&2' ERR

clear
printf "\\033[0;33mCloning Repository\\033[0m\\n"
sleep 1
git clone https://github.com/digitdesign/synopsis;
cd synopsis;
clear
printf "\\033[0;33mConfiguration\\033[0m\\n"
sleep 1
read -e -p "Enter API Key → " API_KEY
sed -i -e "s/YOUR_API_KEY_HERE/$API_KEY/g" config.py
clear
printf "\\033[0;33mCleaning up installation…\\033[0m\\n"
sleep 1
rm -rf 'config.py-e'
rm -rf 'tools'
rm -rf '.git'
rm -rf 'LICENSE.md'
rm -rf 'README.md'
clear
printf "\\033[0;32mSetup Successful\\033[0m\\n"
sleep 0.5
echo "You’re done! Simply replace the ‘records.csv’ file with your desired list of URLs and run __init__.py…"
