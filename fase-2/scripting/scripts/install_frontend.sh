#!/bin/bash


set -x


#-------------------------------------------------------------------------------
# Actualización de los repositorios instalados
apt-get update

# Actualización los programas con respecto a los repositorio descargados
apt-get upgrade -y


#-------------------------------------------------------------------------------
# Instalación de servidor web Apache2
apt-get install apache2 -y


#-------------------------------------------------------------------------------
# Instalación de PHP y varios módulos que necesitamos
apt-get install php libapache2-mod-php php-mysql -y


#-------------------------------------------------------------------------------
# Preparación de configuración de WordPress

# Copiamos la configuración para preparar el AllowOverride
cp ../conf/000-default-frontend.conf /etc/apache2/sites-available

# Copiamos la configuación para priorizar index.php sobre index.html
cp ../conf/dir.conf /etc/apache2/mods-available

# Habilitación del mod rewrite de Apache2
a2enmod rewrite

# Reinicio del servidor Apache
systemctl restart apache2