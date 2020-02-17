# Limesurvey-Vagrant
Pre-configured LimeSurvey Vagrant Box based on Ubuntu Bionic 64bit + PHP7.4 + Mysql + Postgresql + Nginx 

# Pre-installation Requirements
- Enable VT-x
- Install Virtual Box
- Install Vagrant CLI

# Installation

## Optional
- Modify default IP in "configuration/provision.sh" and "vagrant" files.
- Modify default Login for Mysql & Postgres in "configuration/provision.sh" file. 
- Modify LimeSurvey branch to clone in "configuration/provision.sh" file (Default: master).
- Modify Php version to install in "configuration/provision.sh" (Default: 7.4). Available config file for 5.6 and 7.4.
- If you want another version of php copy the default php folder "configuration/7.4", rename it to your php version and modify the fpm version in default file 
## Available variables in the provision file 
### IP
- myIp (Default: 10.0.0.10)
### PHP
- phpVersion (Default: 7.4).
### Mysql
- MysqlRootPass (Default: password).
- MysqlDBName (Default: limesurvey).
- MySqlDBUser (Default: limesurvey).
- MySqlDBPassword (Default: password).
### Postgresql 
- pgDB (Default: limesurvey).
- pgPassword (Default: password).
### Limesurvey
- lsBranch (Defaul: Master).

## install
- Make sure that the host name and ip are not in use (Virtual box) ohterwise change it in the vagrant file.
- run "vagrant up" in the repo root path after cloning.

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