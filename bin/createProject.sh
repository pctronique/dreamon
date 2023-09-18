while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_REACT_CONTAINER bash -c "create-react-app $FOLDER_PROJECT_REACT $@"
docker exec $NAME_REACT_CONTAINER bash -c "chmod 777 -R $FOLDER_PROJECT_REACT"
docker exec $NAME_REACT_CONTAINER bash -c "cd $FOLDER_PROJECT_REACT/ && npm install nodemailer && npm install mongodb"