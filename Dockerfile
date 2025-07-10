FROM php:8.2-apache

# Tambahkan ServerName agar tidak warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install ekstensi PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Set Apache ke port 8080 (Railway default)
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:8080/' /etc/apache2/sites-enabled/000-default.conf

# Copy isi folder web
COPY apotek/web/ /var/www/html/

# Set permission agar bisa dibaca Apache
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

EXPOSE 8080

