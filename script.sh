#!/bin/bash
chmod +x script.sh
# Download the web service repository to the host machine
git clone https://github.com/Zifah/UserManager.git && 

# Navigate to the repository root directory
cd UserManager && 

# Create a .env file to configure the node application
echo "PORT=3000"$'\n'"DB_URL='mongodb://mongo/alcDemo'" > .env &&

# Allow user determine which docker machine our docker images would be contained 
echo "Do you have an existing machine where you want to run this image? (y/N)" &&
read hasMachine && 

if [[ $hasMachine = "Y" || $hasMachine = "y" ]]; then
    echo "Enter machine name:" &&
    read machineName
else
    machineName="alc-exam" &&
    docker-machine create $machineName &&
	eval $(docker-machine env $machineName)
fi &&

# Start the docker machine if it's not currently started
if [[ "$(docker-machine status $machineName)" != "Running" ]]; then
  docker-machine start $machineName
fi &&

# Configure the shell environment to run further commands against the selected Docker machine
eval $(docker-machine env $machineName) &&

# Spin up containers for the web service and its database on the selected Docker machine
docker-compose up 

# Launch the web service on a browser
python -mwebbrowser "http://$(docker-machine ip $machineName):3000/users"
$SHELL