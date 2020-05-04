#!/usr/bin/env bash
set -e
echo "Logging using system assigned idenitity"
az login --identity
az logout
az login --identity

echo "Writing token file to /models/token.txt"
az account get-access-token > /models/token.txt

export ACCOUNT_NAME=$1
export CONTAINER_NAME=$2
export BLOB_NAME=$3
export FILE_NAME=${BLOB_NAME}

ls -la ./models

if [ -f "./models/${FILE_NAME}" ]; then
    echo "$FILE_NAME exist"
else 
    echo "$FILE_NAME does not exist"
    start=$SECONDS
    az storage blob download -c ${CONTAINER_NAME} -n ${BLOB_NAME} -f ./models/${FILE_NAME} --account-name ${ACCOUNT_NAME} --auth-mode login
    duration=$(( SECONDS - start ))
    echo "Time taken for model download ${duration} seconds"
fi


#https://raushankdelete8410197315.blob.core.windows.net/test/.oml_package.zip