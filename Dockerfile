    # Use the official PHP 5.6 image with Apache
    FROM php:5.6-apache

    # Enable Apache mod_rewrite (important for many PHP apps)
    RUN a2enmod rewrite

    # Install PHP extensions as needed (you can add others based on your app\'s requirements)
    RUN docker-php-ext-install mysqli pdo pdo_mysql

    # Set the working directory to /var/www/html (default for Apache)
    WORKDIR /var/www/html

    # Copy the app\'s code into the container (assuming your code is in the current directory)
    COPY . /var/www/html

    # Ensure correct permissions for the Apache server to access the files
    RUN chown -R www-data:www-data /var/www/html

    # Expose port 80 for Apache
    EXPOSE 80

    # Start Apache in the foreground
    CMD ["apache2-foreground"]