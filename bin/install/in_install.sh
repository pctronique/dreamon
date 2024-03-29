#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
  exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../../.env

cp ${0%/*}/../../.docker/config/gitignore_angular ${0%/*}/../../project/www/.gitignore

PACK_JSON_LINE1="$FOLDER_PROJECT"
PACK_JSON_LINE1_REPLACE="$NAME_PROJECT"
PACK_JSON_FILE="${0%/*}/../../project/$FOLDER_PROJECT/package.json"
sed -i "s/$PACK_JSON_LINE1/$PACK_JSON_LINE1_REPLACE/" $PACK_JSON_FILE

cd ${0%/*}/../../
if ! docker compose up -d ; then
  exit 1
fi

exit 0
