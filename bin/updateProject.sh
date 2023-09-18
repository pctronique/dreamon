while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_REACT_CONTAINER bash -c "cd $FOLDER_PROJECT_REACT && npm install"
