#!/usr/bin/env bash
while :
do curl -s "wttr.in/San-Nicolas-de-los-Arroyos?format=1" | tr -d ' +'
sleep 1800
done
