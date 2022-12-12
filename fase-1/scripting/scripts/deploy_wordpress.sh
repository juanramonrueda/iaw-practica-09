#!/bin/bash


set -x


# Importación de las variables necesarias
source variables.sh


#-----------------------------------------------------------------------------------------------
# Descarga e implementación de WordPress

# Descarga de WordPress
wget https://wordpress.org/latest.zip -O /tmp/latest.zip

# Instalación de unzip
apt install unzip -y

# Eliminación de instalaciones previas para el lanzado del comando por pruebas
rm -rf /var/www/html/wordpress

# Descompresión del archivo en /var/www/html
unzip /tmp/latest.zip -d /var/www/html


#-----------------------------------------------------------------------------------------------
# Instalación compleja de WordPress

# Copiado de wp-config-sample.php a wp-config.php
cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

# Agregación de la base de datos que se va a utilizar en WordPress
sed -i "s/database_name_here/$DB_Name/" /var/www/html/wordpress/wp-config.php

# Agregación del usuario que se va a utilizar en WordPress
sed -i "s/username_here/$DB_User/" /var/www/html/wordpress/wp-config.php

# Agregación de la contraseña que se va a utilizar en WordPress
sed -i "s/password_here/$DB_Password/" /var/www/html/wordpress/wp-config.php

# Agregación del servidor que tiene la base de datos de WordPress
sed -i "s/localhost/$DB_Host/" /var/www/html/wordpress/wp-config.php


#-----------------------------------------------------------------------------------------------
# Modificación para personalizar la URL y referencia interna de WordPress

# Copiado de index.php de /var/www/html/wordpress a /var/www/html
cp /var/www/html/wordpress/index.php /var/www/html

# Modificación de index.php para redirigir al directorio de WordPress
sed -i "s|wp-blog-header.php|wordpress/wp-blog-header.php|" /var/www/html/index.php

# Modificación del archivo wp-config.php para no mostrar la ruta del directorio en la URL
sed -i "/DB_COLLATE/a define('WP_HOME', '$WP_Home');" /var/www/html/wordpress/wp-config.php

# Modificación del archivo wp-config.php para indicar la ruta interna de WordPress
sed -i "/WP_HOME/a define('WP_SITEURL', '$WP_SiteURL');" /var/www/html/wordpress/wp-config.php


#-----------------------------------------------------------------------------------------------
# Cambiamos el propietario y el grupo a Apache
chown www-data:www-data -R /var/www/html
