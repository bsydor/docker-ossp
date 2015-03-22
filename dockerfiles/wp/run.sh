#!/bin/bash

echo Save evns vars
cat << EOF > /root/wp_envs
export WP_URL=docker0.sydor.net
export WP_TITLE="Open Source Summit 2015"
export WP_ADMIN=admin
export WP_ADMIN_PASSWORD=ossp.2015
export WP_ADMIN_EMAIL=fake@email.com
export DB_NAME=wp
export DB_USER=wp
export DB_PASSWORD
export DB_PASSWORD=ossp.2015
export DB_HOST=45.55.143.54
EOF
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
