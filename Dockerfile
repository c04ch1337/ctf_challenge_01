# Use an official Ubuntu base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    mysql-server \
    php-mysql \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone DVWA (Damn Vulnerable Web Application)
RUN git clone https://github.com/digininja/DVWA /var/www/html/dvwa

# Configure DVWA
RUN cp /var/www/html/dvwa/config/config.inc.php.dist /var/www/html/dvwa/config/config.inc.php
RUN sed -i "s/'db_password' => 'p@ssw0rd'/'db_password' => ''/g" /var/www/html/dvwa/config/config.inc.php

# Expose port 80
EXPOSE 80

# Start Apache and MySQL
CMD service mysql start && service apache2 start && tail -f /dev/null
