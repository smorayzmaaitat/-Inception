#!/bin/bash

service mariadb start 

mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PWD';"


sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf  

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld