# Setting up a multi-machine environment
First, edit the Vagrant file to contain this information.  
Please note that `one` is a test name in this example.

``` ruby  
  Vagrant.configure("2") do |config|

    # config.vm.provider "virtualbox" do |v|
    #   v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    #   v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    #   v.gui = true
    # end

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

These commands will be placed in the provsions file.

Needs to be v3.2

`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5` - imports public key  

`echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list` - Create a list file for Ubuntu 16.04  

`sudo apt-get update` - updates list  

`sudo apt-get install -y mongodb-org` - installs latest verision of MongoDB (but don't use this)
`sudo apt-get install -y mongodb-org=3.2 mongodb-org-server=3.2 mongodb-org-shell=3.2 mongodb-org-mongos=3.2 mongodb-org-tools=3.2`  

**Now check that MongoDB will run**
`sudo service mongod start` - start the service  
`mongo` - check if it runs (use `exit` to return to quit)

### Running tests
Run `rake spec` in spec folder