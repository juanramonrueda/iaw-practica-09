#!/bin/bash


set -x


# Importación de variables
source variables.sh


#------------------------------------------------------------------------------------------------------------------------------------
# Instalación de cliente NFS

# Instalación de cliente NFS
apt install nfs-common -y

# Montaje de NFS Server en la máquina cliente
mount $Private_IP_NFS_Server:/var/www/html /var/www/html

echo "$Private_IP_NFS_Server:/var/www/html  /var/www/html   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab