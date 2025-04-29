# Use official PHP image with Apache
FROM php:8.2-apache

# Install required extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy all files to container
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod 755 /var/www/html \
    && touch /var/www/html/users.json \
    && touch /var/www/html/error.log \
    && chmod 644 /var/www/html/users.json \
    && chmod 644 /var/www/html/error.log

# Set working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80