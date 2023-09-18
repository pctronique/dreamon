while read line  
do   
   export $line
done < ${0%/*}/.env
cd /home/project/$FOLDER_PROJECT_REACT
npm start >> ../../projecttmp/logs/react/react_out.log 2>> ../../projecttmp/logs/react/react_error.log
