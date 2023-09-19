mkdir -p projecttmp
mkdir -p projecttmp/logs
mkdir -p projecttmp/logs/react
mkdir -p projecttmp/mongo_data

touch projecttmp/logs/react/react_out.log
touch projecttmp/logs/react/react_error.log

chmod 777 -R project
chmod 777 -R projecttmp

# creation du fichier .env
if [ ! -e .env ]
then
    cp .env.example .env
fi

docker-compose up -d

./bin/import_sgbd.sh

./bin/createProject.sh
#./bin/updateProject.sh
./start.sh
