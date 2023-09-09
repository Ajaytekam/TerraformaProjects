#!/bin/bash   

apt install apache2 unzip wget -y
systemctl enable apache2
systemctl start apache2
wget https://www.free-css.com/assets/files/free-css-templates/download/page295/carint.zip -O /tmp/file.zip
cd /tmp
unzip file.zip 
mv carint-html/* /var/www/html/
chown -R www-data:www-data /var/www/html/*
rm -rf file.zip carint-html
