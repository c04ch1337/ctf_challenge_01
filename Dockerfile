# Dockerfile
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install dependencies
RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php curl tzdata && \
    apt-get clean

# Copy web files
COPY web/ /var/www/html/

# Copy setup scripts
COPY scripts/setup_app.sh /usr/local/bin/setup_app.sh
COPY scripts/setup_flags.sh /usr/local/bin/setup_flags.sh

# Set permissions
RUN chmod +x /usr/local/bin/setup_app.sh && \
    chmod +x /usr/local/bin/setup_flags.sh

# Expose port 80
EXPOSE 80

# Run setup scripts
RUN /usr/local/bin/setup_app.sh && \
    /usr/local/bin/setup_flags.sh

# Start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
