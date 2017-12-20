#!/bin/bash
chmod +x script.sh
git clone https://github.com/Zifah/UserManager.git && 
cd UserManager && 
echo "PORT=3000"$'\n'"DB_URL='mongodb://mongo/alcDemo'" > .env &&
echo "Do you have an existing machine where you want to run this image?" &&
read hasMachine && 

if [[ $hasMachine = "Y" || $hasMachine = "y" ]]; then
    echo "Enter machine name:" &&
    read machineName
else
    machineName="alc-exam" &&
    docker-machine create $machineName &&
	eval $(docker-machine env $machineName)
fi &&

if [[ "$(docker-machine status $machineName)" != "Running" ]]; then
  docker-machine start $machineName
fi &&

eval $(docker-machine env $machineName) &&
docker-compose up 
python -mwebbrowser "http://$(docker-machine ip $machineName):3000"
$SHELL