Vagrant.configure("2") do |config|

  # create app box
  config.vm.define "app" do |app|

    # creating a virtual machine ubuntu
    app.vm.box = "ubuntu/xenial64"
    # config.vm.boot_timeout = 600

    # attatching a private network with an ip
    app.vm.network "private_network", ip: "192.168.10.100"
    
    # let's create an alias to link this ip with logical web address
    # app.hostsupdater.aliases = ["development.local"]
    
    # transfer files from OS to the VM
    app.vm.synced_folder ".", "/home/vagrant/starter_code/app"
    #
    app.vm.provision "shell", path: "starter_code/environment/app/provision.sh", privileged: true

    # app.vm.provision "shell", inline: set_env({ DB_HOST: "mongodb://192.168.10.150:27017/posts" }), privileged: false
    # app.vm.provision "shell", inline: "echo "export DB_HOST=mongodb://192.167.10.101:27017/posts" >> /etc/profile.d/myvars.sh", run: "always", privileged: false

  end
  

  # configure a second machine
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"

    db.vm.network "private_network", ip: "192.168.10.110"
    # db.vm.network "forwarded_port", guest: 27017, host: 27017

    # db.hostsupdater.aliases = ["database.local"]

    # transfer files from OS to the VM
    db.vm.synced_folder ".", "/home/vagrant/starter_code/app"

    db.vm.provision "shell", path: "starter_code/environment/db/provision.sh"

  end

end
