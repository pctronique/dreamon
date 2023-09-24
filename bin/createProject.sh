#!/bin/bash
if ! ${0%/*}/install/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_PROJECT_CONTAINER bash -c "create-react-app $FOLDER_PROJECT $@"
docker exec $NAME_PROJECT_CONTAINER bash -c "chmod 777 -R $FOLDER_PROJECT"
   ${0%/*}/install/in_install.sh
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT/ && npm install nodemailer"
docker exec $NAME_PROJECT_CONTAINER bash -c "cd $FOLDER_PROJECT/ && npm install mongodb"

exit 0
