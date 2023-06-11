#!/bin/bash

cd /usr/src/app

pip3 install wget

apt install unzip -y

wget https://github.com/psiphon15/LIB-Railway/releases/download/Finale/LIB-Railway-main.zip -O temp.zip
unzip temp.zip

pip3 install -r requirements.txt -q --no-cache-dir

python3 -m gunicorn --bind 0.0.0.0:31145 main:app
