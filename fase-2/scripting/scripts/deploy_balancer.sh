#!/bin/bash

set -x

# Importación de variables
source variables.sh


#-----------------------------------------------------------------------------------------------
# Actualización de los repositorios de la máquina
apt update


#-----------------------------------------------------------------------------------------------
# Actualizaciónde los programas con respecto a los repositorios instalados
apt upgrade -y


#-----------------------------------------------------------------------------------------------
# Instalación de Apache2
apt install apache2 -y


#-----------------------------------------------------------------------------------------------
# Módulos para el balanceador de carga
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_ajp
a2enmod rewrite
a2enmod deflate
a2enmod headers
a2enmod proxy_balancer
a2enmod proxy_connect
a2enmod proxy_html
a2enmod lbmethod_byrequests


#-----------------------------------------------------------------------------------------------
# Copiamos la configuración para el balanceador
cp ../conf/000-default-balancer.conf /etc/apache2/sites-available/000-default.conf


#-----------------------------------------------------------------------------------------------
# Modificamos el archivo ya que no tiene las direcciones IP
sed -i "s/IP_HTTP_SERVER_1/$IP_HTTP_Server_1/" /etc/apache2/sites-available/000-default.conf
sed -i "s/IP_HTTP_SERVER_2/$IP_HTTP_Server_2/" /etc/apache2/sites-available/000-default.conf


#-----------------------------------------------------------------------------------------------
# Reinicio del sservidor Apache2
systemctl restart apache2