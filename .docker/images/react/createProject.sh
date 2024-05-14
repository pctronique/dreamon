#!/bin/bash

if [ -z ${NODE_FOLDER_PROJECT} ]
then
    NODE_FOLDER_PROJECT=/home/project/www/
fi

if [ -z ${NODE_FOLDER_LOG} ]
then
    NODE_FOLDER_LOG=/var/log/docker/nodejs/
fi

if [ -z ${NODE_FOLDER_INIT} ]
then
    NODE_FOLDER_INIT=/var/docker/nodejs/
fi

if [ -z "$(ls -A ${NODE_FOLDER_PROJECT})" ]; then

  create-react-app .

  if [ -e ${NODE_FOLDER_INIT}/packages_install.list ]
  then
    while read line  
    do   
      if [ ! -z "$line" ]
      then
        npm install $line >> ${NODE_FOLDER_LOG}/initnodejs.log 2>> ${NODE_FOLDER_LOG}/initnodejs.log
      fi
    done < ${NODE_FOLDER_INIT}/packages_install.list
  fi

fi

npm install >> ${NODE_FOLDER_LOG}/initnodejs.log 2>> ${NODE_FOLDER_LOG}/initnodejs.log

touch ${NODE_FOLDER_LOG}/error.log

service startserver start && tail -F ${NODE_FOLDER_LOG}/error.log &

exit 0
