#!/bin/bash


set -x


#-------------------------------------------------------------------------------
# Actualización de los repositorios instalados
apt-get update


# Actualización los programas con respecto a los repositorios descargados
apt-get upgrade -y


#-------------------------------------------------------------------------------
# Instalación de PHP y varios módulos que necesitamos
apt-get install mysql-server -y


#-------------------------------------------------------------------------------
# Cambio del bind-address para conectar con la máquina Frontend
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf


#-------------------------------------------------------------------------------
# Reinicio de MySQL Server para aplicar los cambios realizados
systemctl restart mysql