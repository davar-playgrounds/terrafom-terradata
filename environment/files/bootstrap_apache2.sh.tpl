#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo service apache2 stop

# customize apache2
APACHE_RUN_USER=www-data
APACHE_RUN_GROUP=www-data

# apache pid file
APACHE_VAR_RUN='/var/run/apache2'
sudo chown -R ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ${APACHE_VAR_RUN}

# apache port
PORT=${CUSTOM_PORT}
sudo cp /etc/apache2/ports.conf /etc/apache2/ports.conf.saved
sudo sed -i "s|^Listen.*|Listen ${PORT}|" /etc/apache2/ports.conf
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.saved
sudo sed -i "s|:80|:${PORT}|" /etc/apache2/sites-available/000-default.conf

# apache2 log
APACHE_LOG_DIR='/var/log/tdcustom/accesslogs'
sudo mkdir -p ${APACHE_LOG_DIR}
sudo chown -R ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ${APACHE_LOG_DIR}
sudo cp /etc/apache2/envvars /etc/apache2/envvars.saved
sudo sed -i "s|APACHE_LOG_DIR=.*|APACHE_LOG_DIR=${APACHE_LOG_DIR}|" /etc/apache2/envvars

# home page
ROOT_DIR='/var/www/html'
HOME_PAGE=${ROOT_DIR}/index.html
sudo echo 'hello world!' > /tmp/index.html
sudo cp /tmp/index.html ${HOME_PAGE}

sudo -u ${APACHE_RUN_USER} service apache2 restart
