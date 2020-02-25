# Limesurvey-Vagrant
Pre-configured LimeSurvey Vagrant Box based on Ubuntu Bionic 64bit + PHP7.4 + Mysql + Postgresql + Nginx 

# Pre-installation Requirements
- Enable VT-x
- Install Virtual Box
- Install Vagrant CLI

# Installation

## Optional
- Modify default IP in  "vagrantfile" files.
- Modify default Login for Mysql & Postgres in "vagrantfile" file. 
- Modify LimeSurvey branch to clone in "vagrantfile" file (Default: master).
- Modify Php version to install in "vagrantfile" (Default: 7.4). Available config file for 5.6 and 7.4.
- If you want another version of php copy the default php folder "configuration/7.4", rename it to your php version and modify the fpm version in default file 
## Available variables  
### IP
- ip (Default: 10.0.0.10)
### PHP
- phpversion (Default: 7.4).
### Mysql
- mysqlRootPass (Default: password).
- mysqlDBName (Default: limesurvey).
- mySqlDBUser (Default: limesurvey).
- mySqlDBPassword (Default: password).
### Postgresql 
- postgresDB (Default: limesurvey).
- postgresPassword (Default: password).
### Limesurvey
- limeSurveyBranch (Defaul: Master).
### Xdebug ide Key
- ide key of your code editor for Xdebug

## install
- Make sure that the host name and ip are not in use (Virtual box) ohterwise change it in the vagrant file.
- run "vagrant up" in the repo root directory. 

# Multimachine setup  
- Remove the Vagrantfile in the root directory and rename "multi.vagrantfile" to "Vagrantfile"
- 3 default machines are setting up: "master", "develop", "lts"
- Make sure that the host name and ip (for each machine) are different and not in use (Virtual box) ohterwise change it in the Vagrantfile.
- run "vagrant up" in the repo root directory. 

# Packages 
- Nginx 
- Php7.4 | Php5.6  + Depencies + Libraries
- Mysql server
- Postgresql server
- Latest version (Master) of Limesurvey 

# Default Mysql Login
- MySql DB = "limesurvey"
- MySql User = "limesurvey"
- Mysql Root Password = "password"
- MySql User Password = "password"

# Default Postgresql Login
- pg DB = "limesurvey"
- pg User = "postgres"
- pg Password = "password"

# Default IP address of the webserver after installation
- 10.0.0.10

# Limesurvey Info
- Visit Limesurvey at https://www.limesurvey.org
- Git https://github.com/LimeSurvey/LimeSurvey

# Developer 
- Eddy Lackmann 
- Email: a.eddy@hotmail.de
- Github: https://github.com/eddylackmann