#!/bin/bash

# run the update command [x]
sudo apt-get update -y

# upgrade? [x]
sudo apt-get upgrade -y

# install nginx [x]
sudo apt-get install nginx -y

# install Nodejs (version 6) + dependancies [x]
sudo apt-get install python-software-properties -y

# [x]
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# [x]
sudo apt-get install nodejs -y

# [x] to make sure the following command works
# sudo apt-get install npm -y

# [] now install pm2 with npm
sudo npm install -g pm2