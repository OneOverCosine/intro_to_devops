#!/bin/bash

# run the update command
sudo apt-get update -y

# upgrade?
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install Nodejs (version 6) + dependancies
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# to make sure the following command works
sudo apt-get install -y npm

# now install pm2 with npm
sudo npm install pm2 -g