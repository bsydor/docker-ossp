#!/bin/bash

echo Check if WP is initialized
cd /var/www/html
wp core is-installed
rc=$?
if [ "$rc" -eq "1" ]; then
    echo Initialize WP
    wp core install --url=${WP_URL} --title="${WP_TITLE}"  --admin_user=${WP_ADMIN}  --admin_password=${WP_ADMIN_PASSWORD}  --admin_email=${WP_ADMIN_EMAIL}
fi

echo Start Apache
httpd -D FOREGROUND
