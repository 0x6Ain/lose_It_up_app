#!/bin/bash
# set -e
envPath="$PWD/config" # Path to the folder where all our .env files live
env=$1

if [ -z "$1" ]; then
    echo "No environment supplied, allowed: [dev, stage, prod]"
    exit 1
fi


cp -f "$envPath/.env.$env" "./.env" 
if [ $? -ne 0 ]
then
    echo "there was an error" 
    exit 1
else
    echo "Copied '.env.$env' to '.env'"
fi