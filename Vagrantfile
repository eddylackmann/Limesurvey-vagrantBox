# -*- mode: ruby -*-
# vi: set ft=ruby :

# Developer: Eddy Lackmann
# Github:https://github.com/eddylackmann 
# Last update: 13 february 2020
# Email: a.eddy@hotmail.de

# Vagrant Configuration for Limesurvey

Vagrant.configure("2") do |config|

  # Latest version of Ubuntu. Feel free to update it.
  config.vm.box = "ubuntu/bionic64"

  #provision file (Depencies and software to install when the vagrant start for the first time)
  config.vm.provision "shell", path: "configuration/provision.sh"

  # This IP is reachable only from your computer, not from local network.
  config.vm.network "private_network", ip: "10.0.0.10"
  config.vm.hostname = "LimeSurveyVagrant"

  # The shared folder /var/www/ is not reachable via Internet
  # only /var/www/public is
  config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

  # Needed for Windows 10 host, so ubuntu package are reachable and we can install the VirtualBox Guest Additions
  config.vm.provider "virtualbox" do |vb|
      vb.name = "Limesurvey"
      vb.memory = 2096
      vb.cpus = 2
      #enable this line on windows machine (Optional).
      #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
