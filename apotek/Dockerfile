FROM php:8.2-apache

# 1. Ekstensi PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev \
 && docker-php-ext-install pdo_pgsql pgsql

# 2. Copy source code
COPY apotek/ /var/www/html/

# 3. Aktifkan mod_rewrite (opsional utk .htaccess)
RUN a2enmod rewrite

# 4. Wajib: tulis ports.conf di runtime lalu jalankan Apache
#    $PORT akan terisi nilai dinamis dari Railway
CMD sh -c 'echo "Listen ${PORT}" > /etc/apache2/ports.conf && apache2-foreground'

# 5. Deklarasikan satu port “dummy”; angka apa saja aman
EXPOSE 8080
