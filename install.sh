#!/bin/bash
case "$1" in
  --del-port)
    rm -f -r "${0%/*}/.env"
    ;;
   
  --help)
    echo "$ .install.sh"
    echo "Ou"
    echo "$ .install.sh [option]"
    echo "Options:"
    echo "   --del-port : Pour modifier le numéros des ports."
    echo "   --helps    : Pour afficher l'aide."
    exit 0
    ;;

esac

if [ ! -e ${0%/*}/.env ]
then
  if ! ${0%/*}/bin/install/create_env_exp.sh ; then
    exit 1
  fi
fi

if [ -e ${0%/*}/tmp_install/type_install ]
then
  while read line  
  do   
    export $line
  done < ${0%/*}/tmp_install/type_install
else
  TYPE_INSTALL_PROJECT="update"
fi

mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/logs/react
mkdir -p projecttmp/mongo_data

touch projecttmp/logs/react/react_out.log
touch projecttmp/logs/react/react_error.log

rm -f -r "/tmp/error_chmod_docker.log"
chmod 777 -R ${0%/*}/project 2> /tmp/error_chmod_docker.log
chmod 777 -R ${0%/*}/projecttmp 2> /tmp/error_chmod_docker.log
rm -f -r "/tmp/error_chmod_docker.log"

# creation du docker du projet
if docker compose up -d ; then

  if ! ${0%/*}/bin/install/import_sgbd.sh ; then
    exit 1
  fi

  if [ $TYPE_INSTALL_PROJECT = "install" ]
  then
    if ! ${0%/*}/bin/install/createProject.sh ; then
      exit 1
    fi
  else
    if ! ${0%/*}/bin/install/updateProject.sh ; then
      exit 1
    fi
  fi

  if ! ${0%/*}/start.sh ; then
    exit 1
  fi

  if ! rm -f -r "${0%/*}/tmp_install" ; then
    exit 1
  fi

  ${0%/*}/bin/install/display_web.sh

fi
