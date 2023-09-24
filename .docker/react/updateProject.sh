while read line  
do   
   export $line
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT
npm start >> /var/log/react/react_out.log 2>> /var/log/react/react_error.log
