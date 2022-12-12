#!/bin/bash


set -x


# Importación de las variables necesarias
source variables.sh


#-----------------------------------------------------------------------------------------------
# Creación de base de datos con usuario y contraseña

echo "DROP DATABASE IF EXISTS $DB_Name" | mysql -u root
echo "CREATE DATABASE $DB_Name CHARACTER SET utf8mb4" | mysql -u root

echo "DROP USER IF EXISTS $DB_User@'%'" | mysql -u root
echo "CREATE USER $DB_User@'%' IDENTIFIED BY '$DB_Password'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $DB_Name.* TO $DB_User@'%'" | mysql -u root
