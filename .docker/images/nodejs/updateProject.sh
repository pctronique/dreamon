#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_NAME_JS_SERVER} ]
then
    NODE_NAME_JS_SERVER=server.js
fi

cd ${NODE_FOLDER_PROJECT}
npm start >> ${NODE_FOLDER_LOG}/react_out.log 2>> ${NODE_FOLDER_LOG}/react_error.log
