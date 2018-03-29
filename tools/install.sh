#!/usr/bin/env bash

git clone https://github.com/digitdesign/synopsis;
cd synopsis;
echo -n "Your API Key → "
read APIKEY
git commit -am "$APIKEY" -s
sed -i -e "s/YOUR_API_KEY_HERE/$APIKEY/g" config.py
clear
echo "You're done! Simply replace the 'records.csv' file with your desired list of URLs and run __init__.py"
