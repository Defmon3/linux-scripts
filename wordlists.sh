#!/bin/bash

#Install some wordlists
if ! [ -f "/usr/share/wordlists/xsspayloads.txt" ]; then
  if ! [ -d "/usr/share/wordlists" ]; then
    sudo mkdir -p /usr/share/wordlists
  fi
  sudo wget https://raw.githubusercontent.com/payloadbox/xss-payload-list/master/Intruder/xss-payload-list.txt -O /usr/share/wordlists/xsspayloads.txt
fi

if ! [ -f "/usr/share/wordlists/sql-injection-payload-list.git" ]; then
  if ! [ -d "/usr/share/wordlists/sql-injection-payload-list" ]; then
    sudo mkdir -p /usr/share/wordlists/sql-injection-payload-list
  fi
  sudo git clone https://github.com/payloadbox/sql-injection-payload-list.git /usr/share/wordlists/sql-injection-payload-list
fi

