FROM php:8.2-apache

# Install PostgreSQL extension
RUN apt-get update && apt-get install -y libpq-dev \
 && docker-php-ext-install pdo_pgsql pgsql

# Copy file ke public folder Apache
COPY apotek/ /var/www/html/

# Aktifkan mod_rewrite (opsional)
RUN a2enmod rewrite

# Override port Apache agar pakai PORT dari Railway
ENV PORT=8080
RUN echo "Listen ${PORT}" > /etc/apache2/ports.conf

EXPOSE 8080
CMD ["apache2-foreground"]
