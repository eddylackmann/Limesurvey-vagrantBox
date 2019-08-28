# Limesurvey-Vagrant
Pre-configured Limesurvey (Latest Release) Vagrant Box based on Ubuntu Bionic 64bit + PHP7.2 + Mysql + Nginx 

# Pre-installation Requirements
- Enable VT-x
- Install Virtual Box
- Install Vagrant CLI

# Installation
- Install the vagrant Ubuntu Bionic: vagrant init ubuntu/bionic64
- (Optional) you can modify the default IP address in the vagrant file(vagrantfile) & in the provision file (configuration/provision.sh)
- (Optional) you can also modify the php.ini file in (configuration/php.ini)
- run "vagrant up" in the repo root path after cloning.

# Packages 
- Nginx 
- Php7.2 & depencies
- Mysql server
- Latest version (Master) of Limesurvey 

# Default Mysql default Login
- MySql DB = "limesurvey"
- MySql User = "limesurvey"
- Mysql Root Password = "password"
- MySql User Password = "password"

# Default IP address of the webserver after installation
- 10.0.0.40

# Limesurvey Info
- Visit Limesurvey at https://www.limesurvey.org
- Git https://github.com/LimeSurvey/LimeSurvey
