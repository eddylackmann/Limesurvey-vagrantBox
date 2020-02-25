# -*- mode: ruby -*-
# vi: set ft=ruby :

# Developer: Eddy Lackmann
# Github:https://github.com/eddylackmann 
# Last update: 18 february 2020
# Email: a.eddy@hotmail.de

# Vagrant Configuration for Limesurvey
Vagrant.configure("2") do |config|
  #Custom variable for installation
  ip                = "10.0.0.10"
  #php setup
  phpversion        = "7.4" 
  #mysql setup
  mysqlRootPass     = "password"
  mysqlDBName       = "limesurvey"
  mySqlDBUser       = "limesurvey"
  mySqlDBPassword   = "password"
  #postgres setup
  postgresDB        = "limesurvey"
  postgresPassword  = "password"
  #limesurvey setup
  limeSurveyBranch  = "master"
  #IDE KEY for Xdebug
  ideKey  = "VSCODE"
  
  # Latest version of Ubuntu. Feel free to update it.
  config.vm.box = "ubuntu/bionic64"
  #share webfolder
  config.vm.synced_folder "./limesurvey", "/var/www", :mount_options => ["dmode=777", "fmode=666"], create:true
  #copy config
  config.vm.provision "file", source: "./configuration", destination: "/var/www/configuration"
  #provision file (Depencies and software to install when the vagrant start for the first time)
  config.vm.provision "shell", path: "provision/provision.sh" ,  :args => [ip, phpversion,mysqlRootPass,mysqlDBName,mySqlDBUser,mySqlDBPassword,postgresDB,postgresPassword,limeSurveyBranch,ideKey]
  
  #custom port mapping 
  #config.vm.network "forwarded_port", guest: 80, host: 80   webserver localhost
  #config.vm.network "forwarded_port", guest: 3306, host: 3306 mysql
  #config.vm.network "forwarded_port", guest: 5432, host: 5432 postgres

  # This IP is reachable only from your computer, not from local network.
  config.vm.network "private_network", ip: ip
  config.vm.hostname = "LimeSurvey"
  # Needed for Windows 10 host, so ubuntu package are reachable and we can install the VirtualBox Guest Additions
  config.vm.provider "virtualbox" do |vb|
      vb.name = "Limesurvey"
      vb.memory = 2096
      vb.cpus = 2
      #enable this line on windows machine (Optional).
      #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
