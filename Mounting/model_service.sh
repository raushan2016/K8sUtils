#!/usr/bin/env bash
set -e
echo "Starting model service"
sleep 300000000


cat ./models/token.txt

echo "--------------------"
cat ./models/datetime.txt
echo "--------------------"
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
   #exit 404
fi
    sleep 30
    cat ./models/datetime.txt > /dev/termination-log
    #exit 202
done