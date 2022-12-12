#!/bin/bash


set -x


#--------------------------------------------------------------------------------
# Actualización de paquetes
apt update

# Actualización de los programas con respecto a los repositorios descargados
apt upgrade -y

# Instalación de NFS Server
apt install nfs-kernel-server -y


#--------------------------------------------------------------------------------
# Preparacón de NFS Server para los clientes

# Creamos el directorio que queremos compartir
mkdir -p /var/www/html

# Cambiamos el propietario y el grupo para ninguno
chown nobody:nogroup /var/www/html

# Copiado de plantilla a /etc/exports
cp ../conf/exports /etc/exports

# Reinicio de NFS Server
systemctl restart nfs-kernel-server
