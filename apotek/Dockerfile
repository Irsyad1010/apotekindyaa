FROM php:8.2-apache

# Tambahkan ServerName
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Ganti Apache listen port ke 8080 (Railway butuh ini)
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Install PostgreSQL extension
RUN apt-get update && apt-get install -y libpq-dev \
  && docker-php-ext-install pdo pdo_pgsql

# Aktifkan rewrite module
RUN a2enmod rewrite

# Copy semua file project
COPY . /var/www/html/

# Set permission
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Railway only exposes port 8080
EXPOSE 8080
