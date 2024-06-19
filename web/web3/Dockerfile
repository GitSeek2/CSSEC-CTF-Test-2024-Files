FROM ctftraining/base_image_nginx_mysql_php_73

COPY src /var/www/html

RUN mv /var/www/html/flag.sh / \
    && chmod +x /flag.sh \
    && chown -R www-data:www-data /var/www/html \
    && sed -i 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf