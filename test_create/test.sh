#!/bin/bash

NODE_FOLDER_PROJECT=${0%/*}
NODE_NAME_PROJECT=project

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_NAME_PROJECT} ]
then
    NODE_NAME_PROJECT=project
fi

VAR_NAME_DEF=$(sed -ne "s/\\\"name\": \".*\",/\0/p" ${NODE_FOLDER_PROJECT}/package.json)
VAR_MODIF_NAME="\"name\": \"${NODE_NAME_PROJECT}\","

sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/" "${NODE_FOLDER_PROJECT}/package.json"
sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/" "${NODE_FOLDER_PROJECT}/package-lock.json"
echo $var