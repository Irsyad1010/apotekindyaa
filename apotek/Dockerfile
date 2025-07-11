# Gunakan image PHP + Apache
FROM php:8.2-apache

# Instal ekstensi yg diperlukan
RUN apt-get update && apt-get install -y libpq-dev \
 && docker-php-ext-install pdo_pgsql pgsql

# Copy source code
COPY apotek/ /var/www/html/

# Pastikan htaccess (jika ada) berfungsi
RUN a2enmod rewrite

# Railway memberi PORT dinamis → gunakan ENV
ENV PORT=8080
EXPOSE 8080

CMD ["apache2-foreground"]
