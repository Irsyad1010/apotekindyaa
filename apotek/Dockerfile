FROM php:8.2-apache

# Tambahkan ServerName untuk menghindari warning Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install ekstensi PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Salin isi folder web ke dalam /var/www/html
COPY web/ /var/www/html/

# Set permission agar Apache bisa akses file
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Opsional: Buka port 80 (biasanya Railway auto-handle)
EXPOSE 80
