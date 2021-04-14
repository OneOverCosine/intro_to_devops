# An Introduction to DevOps
Before DevOps, the teams that worked on the software projects would all be separate. Each team had their own jobs that they worked on, and there was little to no communication between them.  

### Problems

- Working in silos, Development and Operations teams don't communicate effectively; Development wants to quickly role out new features while Operations want to maintain a stable product.
- Development and production environments are often different. Code that works for the developers can end up with bugs when moved into production.
- It can take anywhere from weeks to months for the Operations team to review the work the developers have done, slowing things down for them.
- Development can feel as though the operations team is slowing things down
- The operations team can feel as though development is leaving them with code that will break

### Additional info
(The cloud became more popular in software development). Why? It is a lot more scalable than using traditional servers. 

## Application Design Patterns
### Monolith, N-tier, and Microservices
*The Monolith* - All the code and the different parts of it are built together. Useful for small projects.  
*N-tier* - Also called multi-tier. Processing, data management, and presentation functions are kept physically and logically separate.  
*Microservices* -  

## What is DevOps?
- A collaboration of Development and Operations
- A culture which promotes collaboration bweteen the Dev and Ops teams
- A practice of development and operation 

Shortens the time of production without comppromising on quality

## Why do we need it?
- The focus on automation means that less time is spent doing repetitive tasks
- Development and production environments are the same, meaning that errors relating to the environment no longer happen
- Software is written in small chunks. This allows for more frequent tests and code reviews so any problems are caught quickly and accurately

## What does DevOps offer
- Ease of use
- Flexibility
- Robustness
- Cost

## DevOps Principles

## Stages in DevOps Lifecycle
- Development
- Testing
- Integration
- Deployment
- Monitoring

## DevOp Values
 CAMS model
 - Culture
 - Automation
 - Measurement
 - Sharing 

 ## Conclusion..?
 Remember that it's not a job role, it's a culture. DevOps *Engineer* is the role

 # Vagrant
 ### Some Vagrant Commands
 `vagrant up` to spin up a virtual machine  
 `vagrant destroy` to destroy a machine  
 `vagrant reload` to reload a machine  
 `vagrant status` to check no. of machines and if they are running  
 `vagrant halt` halts a machine
 `vagrant ssh machine_name` to ssh into a machine. `machine_name` is required if you have more than one available
 `vagrant plugin install vagrant-hostsupdater`

 ## Some Linux commands
 - `sudo command` run a command as an admin
 - `sudo su` move into admin mode
 - `ls` list directory
 - `ll` list dir with permisions
 - `mkdir` create a directory
 - `pwd` lets you know your current directory
 - `nano filename` opens `filename` using the nano editor. If the file doesn't exist, it's created
 - `mv` for moving files. Can also rename files using it
 - `rm` used to remove files
 - `ps` check processes that are running

 Installing NGINX with `sudo apt-get install nginx`  
 Check the install using `systemctl status nginx`

 ### Extra
```
 vagrant plugin uninstall vagrant-hostsupdater
 vagrant plugin install vagrant-hostsupdater --plugin-version=1.0.2
```
---
Also...

### Setting up the enviroment
- add shell script path to our Vagrantfile
- `config.vm.provision "shell", path: "environment/provision.sh"`
- Create a script called `provision.sh` with the following:

```
#!/bin/bash

# run the update command
sudo apt-get update -y

# upgrade?
# sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install Nodejs (version 6) + dependancies
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# now install pm2 with npm
sudo npm install pm2 -g
```

## For a multi-machine setup, click [here](multi_setup.md)

# Testing that the environment is set up correctly

`gem install bundler:2.2.9` -  
`bundle` -  
`rake spec` - Runs the test. Must be in the test directory.