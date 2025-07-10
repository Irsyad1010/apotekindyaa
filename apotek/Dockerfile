FROM php:8.2-apache

# Tambahkan ServerName
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install PostgreSQL extension
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Set Apache listen di port 8080
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:8080/' /etc/apache2/sites-enabled/000-default.conf

# Copy isi folder web ke apache root
COPY web/ /var/www/html/

# Set permission
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Railway ekspektasi port 8080
EXPOSE 8080
