#!/usr/bin/env bash
set -e
echo "Starting model service"

cat ./models/token.txt
export FILE_NAME=$1

while [ : ]
do
    date
    echo "Hostname : $(hostname)"
    ls -la ./models
if [ -f "./models/${FILE_NAME}" ]; then
    echo "$FILE_NAME exist"
else 
    echo "$FILE_NAME does not exist"
        echo "$FILE_NAME does not exist"
        echo "$FILE_NAME does not exist" > /dev/termination-log
    exit 404
fi
    sleep 50
done