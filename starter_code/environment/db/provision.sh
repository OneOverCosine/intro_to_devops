#!/bin/bash


# [] update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# [x]
# install mongodb key
sudo wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

# [x] create mongodb list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# [x]
# run the update command
sudo apt-get update -y

# [x]
# install mongodb packages of version 3.2.20
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# # [x]
# sudo mkdir -p /data/db

# # "chown: invalid user: 'mongodb:mongodb" when this is run
# sudo chown -R mongodb:mongodb /var/lib/mongodb

# sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

# now endable and start mongodb
sudo systemctl restart mongod
sudo systemctl enable mongod
# sudo service mongod start

# echo "DB_HOST = mongodb://localhost:27017/admin" >> ~/app/app/app.env