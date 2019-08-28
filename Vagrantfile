# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant Configuration for ComfortUpdate Server
# 2019 July the 5th
Vagrant.configure("2") do |config|

  # Latest version of Ubuntu. Feel free to update it.
  # but, if it affects PHP version (>7.2), then you will need to update files_to_push/nginx_site_available/default
  config.vm.box = "ubuntu/bionic64"
  config.vm.provision "shell", path: "configuration/provision.sh"

  # This IP is reachable only from your computer, not from local network.
  config.vm.network "private_network", ip: "10.0.0.40"
  config.vm.hostname = "LimeVagrant"

  # The shared folder /var/www/ is not reachable via Internet
  # only /var/www/comfort/web is
  config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

  # Needed for Windows 10 host, so ubuntu package are reachable and we can install the VirtualBox Guest Additions
  config.vm.provider "virtualbox" do |vb|
      vb.name = "Limesurvey-vagrant"
      vb.memory = 2096
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
