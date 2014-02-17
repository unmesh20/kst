!#/bin/bash

#1.Installation of OpenStack Identity Service is done by specifying the keystone package in Ubuntu, and we do this as follows:

sudo apt-get update

sudo apt-get -y install keystone

#2.Once installed, we need to configure the backend database store, so we first create the keystone database in MySQL. We do this as follows:

MYSQL_PASS=project
mysql -uroot -p$MYSQL_PASS -e 'CREATE DATABASE keystone;'


#3.It is good practice to create a user that is specific to our OpenStack Identity Service, so we create this as follows:

mysql -uroot -p$MYSQL_PASS -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%'"

mysql -uroot -p$MYSQL_PASS -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost'"

mysql -uroot -p$MYSQL_PASS -e "SET PASSWORD FOR 'keystone'@'%' = PASSWORD('$MYSQL_PASS');"

mysql -uroot -p$MYSQL_PASS -e "SET PASSWORD FOR 'keystone'@'localhost' = PASSWORD('$MYSQL_PASS');"

#4.We then need to configure OpenStack Identity Service to use this database by editing the /etc/keystone/keystone.conf file, and then change the sql_connection line to match the database credentials. We do this as follows:

sudo sed -i "s#^connection.*#connection = mysql://keystone:$MYSQL_PASS@172.16.0.1/keystone#"/etc/keystone/keystone.conf

#5. Now restart the keystone service

sudo stop keystone

sudo start keystone

#6.Now populate the keystone database with reqd tables by

sudo keystone-manage db_sync

exit
