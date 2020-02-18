#map arguments
myIp=$1
phpVersion=$2
MysqlRootPass=$3
MysqlDBName=$4
MySqlDBUser=$5
MySqlDBPassword=$6
pgDB=$7
pgPassword=$8
lsBranch=$9
cloneLS=$10

#init installer
echo " "
echo " "
echo " "
echo " "
echo "+-----------------------------------+"
echo "+ WELCOME TO LIMESURVEY VAGRANT BOX +"
echo "+-----------------------------------+"
echo " "
echo " "
echo " "
echo " "
sleep 5s;
#update apt Packages
echo " "
echo " "
echo " "
echo " "
echo "+-----------------+"
echo "+ update packages +"
echo "+-----------------+"
apt-get update
apt -y install software-properties-common
add-apt-repository ppa:ondrej/php
apt-get update

echo " "
echo " "
echo " "
echo "Packages updated"
echo "################"
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
echo "##############################"
# Php
echo " "
echo " "
echo " "
echo "+---------------------------+"
echo "+ install PHP $phpVersion and libs +"
echo "+---------------------------+"
echo " "
echo " "
echo " "
sleep 3s;                   
sudo apt-get -y install  "php$phpVersion-gd" "php$phpVersion-mysql" "php$phpVersion-curl" "php$phpVersion-ldap" "php$phpVersion-imap" "php$phpVersion-pgsql"  "php$phpVersion-xml"  "php$phpVersion-cli" "php$phpVersion-mbstring" "php$phpVersion-fpm" "php$phpVersion-opcache" "php$phpVersion-zip" 
sleep 3s;
cp /var/www/configuration/$phpVersion/php.ini /etc/php/$phpVersion/fpm/php.ini
echo " "
echo " "
echo " "
echo " "
echo "PHP $phpVersion- extensions & Libraries installed"
echo "########################################"
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
cp /var/www/configuration/$phpVersion/default /etc/nginx/sites-available/default
echo " "
echo " "
echo " "
echo " "
echo "NGinx installed "
echo "###############"

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
sudo apt-get install "$phpVersion-mysql -y"
echo " "
echo " "
echo " "
echo " "
echo "MySql installed "
echo "###############"
sleep 3s;
# pgsql server
echo " "
echo " "
echo " "
echo "+---------------------------+"
echo "+ install Postgresql Server +"
echo "+---------------------------+"
echo " "
echo " "
echo " "
sleep 3s;
apt install postgresql postgresql-contrib -y
sleep 3s;
sudo su - postgres -c "createdb $pgDB"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$pgPassword';"
echo " "
echo " "
echo " "
echo "Postgresql installed "
echo "####################"
sleep 3s;
#setup database
mysql -u root -p$MysqlRootPass -e "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));"
mysql -u root -p$MysqlRootPass -e "CREATE DATABASE $MysqlDBName;"
mysql -u root -p$MysqlRootPass -e "CREATE USER '$MySqlDBUser'@'localhost' IDENTIFIED BY '$MySqlDBPassword';"
mysql -u root -p$MysqlRootPass -e "GRANT ALL PRIVILEGES ON *.* TO '$MySqlDBUser'@'localhost' WITH GRANT OPTION;"
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
if $cloneLS; then
    git clone -b $lsBranch https://github.com/LimeSurvey/LimeSurvey.git /var/www/public
fi
echo "Limesurvey installed "
echo "#####################"
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
 # Start nginx
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
echo "PHP           [ok]"
echo "NGINX         [ok]"
echo "MYSQL DB      [ok]"
echo "Postgresql    [ok]"
echo "Limesurvey    [ok]"
echo " "
echo " "
echo " "
echo "You can connect to Webserver at: http://$myIp "
echo "the webroot is /public "
echo " "
echo " "
echo " "
echo "Mysql DB:$MysqlDBName"
echo "Mysql login:$MySqlDBUser"
echo "Mysql password:$MySqlDBPassword"
echo "mysql root password: $MysqlRootPass"
echo " "
echo " "
echo " "
echo "postgresql db: $pgDB"
echo "postgresql default user: postgres"
echo "postgresql default password: $pgPassword"
echo " "
echo " "
echo " "
echo "LimeSurveybranch: $lsBranch"
echo " "
echo " "
echo " "
echo "connect to VM SSH in terminal: vagrant ssh"
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
