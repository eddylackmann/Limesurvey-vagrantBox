# Limesurvey-Vagrant
Pre-configured Limesurvey(Latest Release) Vagrant Box based on Ubuntu Bionic 64bit - Php 7.2 - latest Mysql & Nginx webserver

# Pre-installation Requirements
- Enable VT-x
- Install Virtual Box
- Install Vagrant CLI

# Installation
- Install the vagrant Ubuntu Bionic: vagrant init ubuntu/bionic64
- run "vagrant up" in the repo root path after cloning.

# Packages 
- Nginx 
- Php7.2 & depencies
- Mysql server
- Latest version (Master) of Limesurvey 

# Default Mysql Login
- MySql DB = "limesurvey"
- MySql User = "limesurvey"
- Mysql Root Password = "password"
- MySql User Password = "password"

# Default IP address of the webserver after installation
- 10.0.0.40
- you can change the default IP address in the vagrant file & in the provision file (/provision.sh)

# Limesurvey Info
- Visit Limesurvey at https://www.limesurvey.org
- Git https://github.com/LimeSurvey/LimeSurvey
