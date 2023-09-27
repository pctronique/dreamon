#!/bin/bash
while read line  
do   
    if [ ! -z "$line" ]
    then
        export $line
    fi
done < ${0%/*}/.env

if ! docker exec $NAME_PROJECT_CONTAINER bash -c "create-react-app $FOLDER_PROJECT $@" ; then
    echo "error create"
    exit 1
fi
