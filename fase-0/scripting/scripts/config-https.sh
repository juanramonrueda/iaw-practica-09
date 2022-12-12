#!/bin/bash


set -x


#------------------------------------------------------------------------------------------
# Importación de variables
source variables.sh


#------------------------------------------------------------------------------------------
# Descarga y ejecución de Certbot para obtener el certificado de TLS para la máquina

# Instalamos Core mediante Snap
snap install core

# Actualizamos Core
snap refresh core

# Desinstalamos la instalación previa de Certbot del equipo
apt-get remove certbot

# Instalamos Certbot mediante Snap
snap install --classic certbot

# Creamos el enlace simbólico para Certbot y poder ejecutarlo usando únicamente su nombre
ln -s /snap/bin/certbot /usr/bin/certbot

# Ejecutamos Certbot para obtener el certificado para la máquina
certbot --apache -m $Certbot_Email --agree-tos --no-eff-email -d $Certbot_Domain
