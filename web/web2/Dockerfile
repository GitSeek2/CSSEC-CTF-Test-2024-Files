FROM ctftraining/base_image_nginx_php_73

COPY src /var/www/html

RUN mv /var/www/html/flag.sh / \
    && chmod +x /flag.sh \
    && chown -R www-data:www-data /var/www/html