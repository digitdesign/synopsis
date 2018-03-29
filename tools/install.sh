#!/usr/bin/env bash

# Basic
set -o errexit
set -o nounset
set -o pipefail
trap 'echo; echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR

# Installation
clear
printf "\\033[0;33mCloning Repository\\033[0m\\n"
sleep 1
git clone https://github.com/digitdesign/synopsis;
cd synopsis;
clear
printf "\\033[0;33mConfiguration\\033[0m\\n"
sleep 1
echo -n "Your API Key → "
read APIKEY
sed -i -e "s/YOUR_API_KEY_HERE/$APIKEY/g" config.py
printf "\\033[0;33mCleaning up installation\\033[0m\\n"
sleep 1
rm -rf 'config.py-e'
rm -rf 'tools'
clear
echo
printf "\\033[0;32mSetup Successful\\033[0m\\n"
sleep 1
echo "You're done! Simply replace the 'records.csv' file with your desired list of URLs and run __init__.py"
echo
