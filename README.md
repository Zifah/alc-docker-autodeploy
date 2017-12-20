[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# User Manager Auto-Init

This repository contains a bash script that will automatically install a simple [node web service](https://github.com/BolajiOlajide/UserManager) on any computer running Docker.

### Pre-requisites
This guide assumes that you have the [Docker toolbox](https://docs.docker.com/toolbox/) installed on the machine where this bash script will be executed. 

### Installation
* Clone or download this repository to your machine
* Execute the file "script.sh" in the root directory and follow the prompts to completion. You know the script is done executing when the message: "Express server listening on port 3000" is output to the shell

### Usage
You need to get the IP on which your Docker machine is running. To do this:
* Run the command `docker-machine ip {DOCKER-MACHINE-NAME}`. The IP of your machine will be printed to the screen
* Visit "http://{DOCKER.MACHINE.IP}:3000/users/" in your browser. If all went well, then a JSON array containing a list of users in the database will be rendered (the array might be empty on first run).

### Behind the hood
Please read the comments in the script.sh file to understand what's going on behind the hood when you run this script

### Author
[**Hafiz Adewuyi** - Software Engineer, Digital Banking at Access Bank Plc](https://www.linkedin.com/in/hafizadewuyi/)
