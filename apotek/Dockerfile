FROM php:8.2-apache

# Install PostgreSQL extension
RUN apt-get update && apt-get install -y libpq-dev \
 && docker-php-ext-install pdo_pgsql pgsql

# Copy source code
COPY apotek/ /var/www/html/

# Aktifkan mod_rewrite (jika pakai .htaccess)
RUN a2enmod rewrite

# Override port Apache agar sesuai PORT dari Railway (runtime!)
CMD sh -c 'echo "Listen ${PORT}" > /etc/apache2/ports.conf && apache2-foreground'

# Railway akan expose port ini (walau akan diganti dinamis)
EXPOSE 8080
