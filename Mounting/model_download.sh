#!/usr/bin/env bash
set -e
echo "Logging using system assigned idenitity"
az login --identity

az account show

az account get-access-token > /models/token.txt

export ACCOUNT_NAME=$1
export CONTAINER_NAME=$2
export BLOB_NAME=$3
export FILE_NAME=`date +%Y%m%d`-${BLOB_NAME}
start=$SECONDS

az storage blob download -c ${CONTAINER_NAME} -n ${BLOB_NAME} -f ./models/${FILE_NAME} --account-name ${ACCOUNT_NAME} --auth-mode login
duration=$(( SECONDS - start ))
echo `time taken for model download ${AZ_CLIENT_ID}`

#https://raushankdelete8410197315.blob.core.windows.net/test/.oml_package.zip