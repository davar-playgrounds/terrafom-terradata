#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx stop

# customize nginx
# nginx pid file
sudo touch /run/nginx.pid
sudo chown www-data:www-data /run/nginx.pid

# nginx port
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.saved
sudo sed -i "s/listen 80 /listen ${CUSTOM_PORT} /"               /etc/nginx/sites-available/default
sudo sed -i "s/listen \[::\]:80 /listen \[::\]:${CUSTOM_PORT} /" /etc/nginx/sites-available/default

# nginx logs
sudo mkdir -p /var/log/tdcustom/accesslogs
sudo chown -R www-data:www-data /var/log/tdcustom/accesslogs
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.saved
sudo sed -i "s|access_log .*|access_log /var/log/tdcustom/accesslogs/access\.log;|" /etc/nginx/nginx.conf
sudo sed -i "s|error_log .*|access_log /var/log/tdcustom/accesslogs/error\.log;|" /etc/nginx/nginx.conf

# home page
sudo echo 'hello world!' > /tmp/index.html
sudo cp /tmp/index.html /usr/share/nginx/html/index.html

sudo -u www-data service nginx start
