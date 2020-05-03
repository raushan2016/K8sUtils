#!/usr/bin/env bash
set -e
echo "Starting model service"

cat /models/token.txt

while [ : ]
do
    date
    echo "Hostname : $(hostname)"
    ls /models
    sleep 50
done