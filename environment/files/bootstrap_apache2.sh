#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo service apache2 stop

# customize apache2
# apache pid file
sudo chown -R www-data:www-data /var/run/apache2

# apache port
sudo cp /etc/apache2/ports.conf /etc/apache2/ports.conf.saved
sudo sed -i "s|^Listen.*|Listen ${CUSTOM_PORT}|" /etc/apache2/ports.conf
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.saved
sudo sed -i "s|:80|:${CUSTOM_PORT}|" /etc/apache2/sites-available/000-default.conf

# apache2 log
sudo mkdir -p /var/log/tdcustom/accesslogs
sudo chown -R www-data:www-data /var/log/tdcustom/accesslogs
sudo cp /etc/apache2/envvars /etc/apache2/envvars.saved
sudo sed -i "s|APACHE_LOG_DIR=.*|APACHE_LOG_DIR=/var/log/tdcustom/accesslogs|" /etc/apache2/envvars

# home page
sudo echo 'hello world!' > /tmp/index.html
sudo cp /tmp/index.html /var/www/html/index.html

sudo -u www-data service apache2 restart
