# Setting up a multi-machine environment
First, edit the Vagrant file to contain this information.

``` ruby  
  Vagrant.configure("2") do |config|

  # replaced 'config' with 'one' to test things
  config.vm.define "app" do |app|

    app.vm.box = "ubuntu/xenial64"
    # config.vm.boot_timeout = 600
    # creating a virtual machine ubuntu

    # attatching a private network with an ip
    app.vm.network "private_network", ip: "192.168.10.100"
    # let's create an alias to link this ip with logical web address
    app.hostsupdater.aliases = ["development.local"]
    # transfer files from OS to the VM
    app.vm.synced_folder ".", "/home/vagrant/starter_code/app"
    #
    app.vm.provision "shell", path: "starter_code/environment/app/provision.sh"

  end
  

  # configure a second machine
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"

    db.vm.network "private_network", ip: "192.168.10.110"
    # db.vm.network "forwarded_port", guest: 27017, host: 27017

    db.hostsupdater.aliases = ["database.local"]

    # transfer files from OS to the VM
    db.vm.synced_folder ".", "/home/vagrant/starter_code/app"

    db.vm.provision "shell", path: "starter_code/environment/db/provision.sh"

  end

end
```

### Manual setup of MongoDB on db machine
Only doing this to get an idea of how to do things  
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/  

These commands will be placed in the provsions file for the database.

Needs to be v3.2.20

`sudo apt-get upgrade -y` - upgrade  

`wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -` - import key  

`echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list` - create list file for Ubunbtu 16.04  

`sudo apt-get update -y` - updates list  

`sudo apt-get install -y mongodb-org` - installs latest verision of MongoDB (but don't use this)  

`sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20` - installs the version we want  

---

**Now check that MongoDB will run**
`sudo service mongod start` - start the service  
`mongo` - check if it runs (use `exit` to return to quit)

### Running tests
Run `rake spec` in tests folder