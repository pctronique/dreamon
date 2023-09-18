while read line  
do   
   export $line
done < ${0%/*}/../.env
docker exec $NAME_REACT_CONTAINER /etc/init.d/startserver "$@"
