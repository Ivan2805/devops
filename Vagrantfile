# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
   #config.vm.network "forwarded_port", guest: 8090, host: 8090

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  		 config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:	
		vb.memory = "3072"
 		 #end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2

	config.vm.provision "file", source: "c:/exam3/aws.pem", destination: "~/.ssh/aws.pem"
	config.vm.provision "file", source: "c:/exam3/atlassian-confluence-6.2.1.tar.gz", destination: "~/atlassian-confluence-6.2.1.tar.gz"
 	config.vm.provision "file", source: "c:/exam3/mysql-connector-java-5.1.42.tar.gz", destination: "~/mysql-connector-java-5.1.42.tar.gz"
 	
	config.vm.provision "shell", inline: <<-SHELL
   
    		#installing java


    apt-get -y update
    apt-get -y upgrade
    apt-get -y install software-properties-common htop
    add-apt-repository ppa:webupd8team/java
    apt-get -y update
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    apt-get -y install oracle-java8-installer
    update-java-alternatives -s java-8-oracle
			#installing nginx
	apt-get -y install nginx

			#installing mysql
	sudo add-apt-repository 
    	sudo apt-get update
    	

	debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
	debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
	sudo apt-get install -y mysql-server 
	#sudo apt-get -y install mysql-server-5.6

			#creating DB

	mysql -uroot -proot -e "CREATE DATABASE confluence CHARACTER SET utf8 COLLATE utf8_bin;"
	mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON confluence.* TO 'coneuser'@'localhost' IDENTIFIED BY 'conpass';"

			#installing confluence
	sudo /usr/sbin/useradd --create-home --comment "Account for running Confluence" --shell /bin/bash confluence
	cd ~
	mkdir -p tmp
	cd tmp
	

	wget https://downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-6.2.1.tar.gz
	 
	sudo mkdir /usr/local/confluence
	sudo tar -xzf atlassian-confluence-6.2.1.tar.gz -C /usr/local/confluence
	sudo tar -xzf ~/mysql-connector-java-5.1.42.tar.gz -C /usr/local/confluence/atlassian-confluence-6.2.1/confluence/WEB-INF/lib
	sudo cp /usr/local/confluence/atlassian-confluence-6.2.1/confluence/WEB-INF/lib/mysql-connector-java-5.1.42/mysql-connector-java-5.1.42-bin.jar /usr/local/confluence/atlassian-confluence-6.2.1/confluence/WEB-INF/lib
	
	
	sudo tar -xf atlassian-confluence-6.2.1.tar
	sudo chown -R confluence /usr/local/confluence
 	sudo chmod -R u=rwx,go-rwx /usr/local/confluence
	sudo mkdir /var/confluence-home
	sudo chown -R confluence  /var/confluence-home
 	sudo chmod -R u=rwx,go-rwx  /var/confluence-home
	sudo su confluence
	cd /usr/local/confluence/atlassian-confluence-6.2.1/bin
	./start-confluence.sh
	#./stop-confluence.sh

  SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
end
