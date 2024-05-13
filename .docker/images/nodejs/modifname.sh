#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_NAME_PROJECT} ]
then
    NODE_NAME_PROJECT=project
fi

VAR_NAME_DEF=$(sed -ne "0,/\\\"name\": \".*\",/s//\0/p" ${NODE_FOLDER_PROJECT}/package.json)
VAR_MODIF_NAME="\"name\": \"${NODE_NAME_PROJECT}\","

if [ -e ${NODE_FOLDER_PROJECT}/package.json ]
then
  sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/" "${NODE_FOLDER_PROJECT}/package.json"
fi

if [ -e ${NODE_FOLDER_PROJECT}/package-lock.json ]
then
  sed -i "s/${VAR_NAME_DEF}/${VAR_MODIF_NAME}/" "${NODE_FOLDER_PROJECT}/package-lock.json"
fi

exit 0
