#!/bin/sh
yum -y install httpd php mysql php-mysql
chkconfig httpd on
/etc/init.d/httpd start
if [ ! -f /var/www/html/bootcamp-app.tar.gz ]; then
   cd /var/www/html
   wget https://s3.amazonaws.com/awstechbootcamp/GettingStarted/bootcamp-app.tar.gz
   tar xvfz bootcamp-app.tar.gz
   chown apache:root /var/www/html/rds.conf.php
fi
yum -y update