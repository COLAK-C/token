#!/bin/sh
while true;
do
settings put global airplane_mode_on 1 &>/dev/null;
am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true &>/dev/null;
settings put global airplane_mode_on 0 &>/dev/null;
am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false &>/dev/null;

while true;
do
curl 2>/dev/null &>/dev/null --interface rmnet_data0 http://example.com && break
done

USERNAME=$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | head -c 8)
#echo "{\"consent\":true,\"username\":\"$USERNAME\"}"
curl 2>/dev/null --interface rmnet_data0 https://discordapp.com/api/auth/register --header "Content-Type: application/json" --header "referer: https://discordapp/" -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36" -d "{\"consent\":true,\"username\":\"$USERNAME\"}" | tee -a /sdcard/tokens.txt && echo >> /sdcard/tokens.txt;
echo;
done