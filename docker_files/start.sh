#!/bin/bash
find /var/lib/mysql -type f -exec touch {} \; && service mysql start

node /usr/local/src/mirror-tool-master/index.js

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
