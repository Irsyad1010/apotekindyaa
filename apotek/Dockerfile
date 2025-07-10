FROM php:8.2-apache

# Atur agar Apache listen di PORT 8080 (yang diminta Railway)
ENV PORT=8080

# Ubah konfigurasi Apache agar listen di port 8080
RUN sed -i 's/80/${PORT}/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Hilangkan warning ServerName
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install PostgreSQL ekstensi
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Salin semua file ke direktori web
COPY . /var/www/html/

# Set permission (opsional)
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html
