#!/usr/bin/env bash

# Basic
set -o errexit
set -o nounset
set -o pipefail
trap 'echo; echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR

# Installation
clear
printf "\\033[0;33mCloning Repository\\033[0m\\n"
git clone https://github.com/digitdesign/synopsis;
cd synopsis;
clear
printf "\\033[0;33mConfiguration\\033[0m\\n"
echo -n "Your API Key → "
read APIKEY
sed "s/YOUR_API_KEY_HERE/$APIKEY/g" config.py
clear
printf "\\033[0;33mSetup Successful\\033[0m\\n"
echo "You're done! Simply replace the 'records.csv' file with your desired list of URLs and run __init__.py"
