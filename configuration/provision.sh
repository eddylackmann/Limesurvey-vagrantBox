#set Mysql login details
MysqlRootPass="password"
MysqlDBName="limesurvey"
MySqlDBUser="limesurvey"
MySqlDBPassword="password"

#set Ip Adresse
myIp="10.0.0.40"


#install webserver packages
echo " "
echo " "
echo " "
echo " "
echo "+-----------------------------------+"
echo "+ WELCOME TO LIMESURVEY VAGRANT     +"
echo "+-----------------------------------+"
echo " "
echo " "
echo " "
echo " "
sleep 5s;
echo " #####################################"

#update apt Packages
echo " "
echo " "
echo " "
echo " "
echo "+-----------------+"
echo "+ update packages +"
echo "+-----------------+"
apt-get -y update
echo " "
echo " "
echo " "
echo " "
echo "package updated"
echo " #####################################"
# VBox additions
echo " "
echo " "
echo " "
echo "+------------------------------+"
echo "+ install VBox Guest Additions +"
echo "+------------------------------+"
echo " "
echo " "
echo " "
sleep 3s;
apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)
echo " "
echo " "
echo " "
echo "VBox Guest Additions installed"
echo " #############################"

# Php
echo " "
echo " "
echo " "
echo "+---------------------------+"
echo "+ install PHP 7.2 and libs  +"
echo "+---------------------------+"
echo " "
echo " "
echo " "
sleep 3s;
apt-get install php7.2-fpm -y
apt-get install php7.2-mbstring -y
apt-get install php-curl -y
apt-get install php-pclzip -y
apt-get install php7.2-xml
cp /var/www/configuration/php.ini /etc/php/7.2/fpm/php.ini

echo " "
echo " "
echo " "
echo " "
echo "PHP 7.2, mbstring, curl, pclzip installed"
echo " ########################################"

# Nginx
echo " "
echo " "
echo " "
echo "+---------------+"
echo "+ install NGinx +"
echo "+---------------+"
echo " "
echo " "
echo " "

sleep 3s;
apt-get -y install nginx
cp /var/www/configuration/default /etc/nginx/sites-available/default
echo " "
echo " "
echo " "
echo " "
echo "NGinx installed "
echo " ###############"


# Mysql server
echo " "
echo " "
echo " "
echo "+----------------------+"
echo "+ install Mysql Server +"
echo "+----------------------+"
echo " "
echo " "
echo " "
sleep 3s;
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password '"$MysqlRootPass"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '"$MysqlRootPass"
sudo apt-get -y install mysql-server
sudo apt-get install php7.2-mysql
echo " "
echo " "
echo " "
echo " "
echo "MySql installed "
echo " ##############"
sleep 3s;

#setup database
mysql -u root -p$MysqlRootPass -e "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));"
mysql -u root -p$MysqlRootPass -e "CREATE DATABASE $MysqlDBName;"
mysql -u root -p$MysqlRootPass -e "CREATE USER '$MySqlDBUser'@'localhost' IDENTIFIED BY '$MySqlDBPassword';"
mysql -u root -p$MysqlRootPass -e "GRANT ALL PRIVILEGES ON *.* TO '$MySqlDBUser'@'localhost' WITH GRANT OPTION;"
echo " "
echo " "
echo " "
echo " "
echo " "
sleep 3s;
echo " "
echo " "
echo " "
echo "+----------------------+"
echo "+ install Limesurvey   +"
echo "+----------------------+"
echo " "
echo " "
echo " "

git clone https://github.com/LimeSurvey/LimeSurvey.git /var/www/public
echo "Limesurvey installed "
echo " ##############"
sleep 3s;

IFS=' ' read -r -a array <<< $(/usr/bin/git --git-dir /var/www/public/.git log --pretty=oneline | grep Release | head -n1); /usr/bin/git --git-dir /var/www/public/.git reset --hard "${array[0]}"
sleep 3s;
echo " "
echo " "
echo " "
echo "+----------------------+"
echo "+ Restart Nginx        +"
echo "+----------------------+"
echo " "
echo " "
echo " "

 # Start nGinx
service nginx stop && service nginx start



echo " "
echo " "
echo " "
echo " "
echo " ______      ___   ____  _____  ________  ";
echo "|_   _ \`.  .'   \`.|_   \|_   _||_   __  | ";
echo "  | | \`. \/  .-.  \ |   \ | |    | |_ \_| ";
echo "  | |  | || |   | | | |\ \| |    |  _| _  ";
echo " _| |_.' /\  \`-'  /_| |_\   |_  _| |__/ | ";
echo "|______.'  \`.___.'|_____|\____||________| ";
echo "                                          ";
echo " "
echo " "
echo " "
echo "PHP        [ok]"
echo "NGINX      [ok]"
echo "MYSQL DB   [ok] "
echo "Limesurvey [ok] "
echo " "
echo " "
echo " "
echo "You can connect to Webserver at: http://$myIp "
echo "the webroot is /public "
echo "Mysql DB:$MysqlDBName"
echo "Mysql login:$MySqlDBUser"
echo "Mysql password: password "
echo "mysql root password: password"
echo " "
echo " "
echo "connect to VM SSH in terminal: vagrant ssh"
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
