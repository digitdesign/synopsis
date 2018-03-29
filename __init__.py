#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Description
"""Python3 solution for batch URL shortening using Google’s URL Shortening API (https://goo.gl/)."""

# Package information
__author__ = 'Go Digit General Insurance Ltd.'
__version__ = '1.2.0'
__status__ = 'Production'
__maintainer__ = 'Shaan Shivanandan'
__email__ = 'shaan.shivanandan@godigit.com'
__license__ = 'MIT'
__copyright__ = 'Copyright (c) 2018 Go Digit General Insurance Ltd.'

# Library imports
import os
import sys
import json
import config
import logging
import requests
import pandas as pd

# Library partials
from time import sleep
from random import randint

# Set current working directory
abspath = os.path.abspath(__file__)
cwd = os.path.dirname(abspath)
os.chdir(cwd)

# Constants
SOURCE = pd.read_csv('records.csv', names=['URLs'], header=0)
API_KEY = config.API_KEY
API_URL = 'https://www.googleapis.com/urlshortener/v1/url?key=' + API_KEY

# Array declaration
URLS = SOURCE['URLs'].tolist()
URLS_SHORT = []


# Function definitions
def api_key_validate():
    if API_KEY == 'YOUR_API_KEY_HERE':
        print('Please configure API key in the config.py file.')
        sys.exit()
    else:
        pass


def url_shorten(target):
    post_url = API_URL.format(API_KEY)
    headers = {'content-type': 'application/json'}
    payload = {'longUrl': target}
    sleep(randint(1, 2))
    r = requests.post(post_url, data=json.dumps(payload), headers=headers)
    return r.json()['id']


def url_shorten_batch():
    for i in URLS:
        try:
            URLS_SHORT.append(url_shorten(target=i))
        except Exception as e:
            logging.exception(e)


def csv_export():
    df = pd.DataFrame({'Original URLs': URLS, 'Short URLs': URLS_SHORT})
    df.to_csv('output.csv', index=False, encoding='utf-8')


# Function calls
api_key_validate()
url_shorten_batch()
csv_export()

# Program exit
sys.exit()
