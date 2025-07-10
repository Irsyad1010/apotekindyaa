FROM php:8.2-apache

# Hilangkan warning apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install PostgreSQL extension
RUN apt-get update && apt-get install -y libpq-dev \
  && docker-php-ext-install pdo pdo_pgsql

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Copy isi folder web/ ke direktori html
COPY ./web /var/www/html/

# Atur hak akses
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html
