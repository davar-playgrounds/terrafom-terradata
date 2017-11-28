#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx stop

# customize nginx
NGINX_RUN_USER=www-data
NGINX_RUN_GROUP=www-data

# nginx pid file
NGINX_PID='/run/nginx.pid'
sudo touch ${NGINX_PID}
sudo chown ${NGINX_RUN_USER}:${NGINX_RUN_GROUP} ${NGINX_PID}

# nginx port
PORT=${CUSTOM_PORT}
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.saved
sudo sed -i "s/listen 80 /listen ${PORT} /"               /etc/nginx/sites-available/default
sudo sed -i "s/listen \[::\]:80 /listen \[::\]:${PORT} /" /etc/nginx/sites-available/default

# nginx logs
NGINX_LOG_DIR='/var/log/tdcustom/accesslogs'
sudo mkdir -p ${NGINX_LOG_DIR}
sudo chown -R ${NGINX_RUN_USER}:${NGINX_RUN_GROUP} ${NGINX_LOG_DIR}
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.saved
sudo sed -i "s|access_log .*|access_log ${NGINX_LOG_DIR}/access\.log;|" /etc/nginx/nginx.conf
sudo sed -i "s|error_log .*|access_log ${NGINX_LOG_DIR}/error\.log;|" /etc/nginx/nginx.conf

# home page
ROOT_DIR='/usr/share/nginx/html'
HOME_PAGE=${ROOT_DIR}/index.html
sudo echo 'hello world!' > /tmp/index.html
sudo cp /tmp/index.html ${HOME_PAGE}

sudo -u ${NGINX_RUN_USER} service nginx start
