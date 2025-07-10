FROM php:8.2-apache

# Tambahkan ServerName untuk mencegah warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install PostgreSQL driver
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Aktifkan mod_rewrite
RUN a2enmod rewrite

# Ubah port Apache ke 8080 (wajib untuk Railway)
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:8080/' /etc/apache2/sites-enabled/000-default.conf

# Copy isi folder web ke direktori Apache
COPY web/ /var/www/html/

# Set permission (opsional tapi aman)
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Railway hanya menerima koneksi di port 8080
EXPOSE 8080

# Jalankan Apache saat container start
CMD ["apache2-foreground"]
