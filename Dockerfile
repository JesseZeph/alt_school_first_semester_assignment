# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set environment variables to prevent some interactive issues
ENV DEBIAN_FRONTEND=noninteractive

# Update the package repository and install Apache and git
RUN apt-get update && \
    apt-get install -y apache2 git && \
    apt-get clean

# Copy the content of your project into the container
COPY . /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Apache in the foreground (to keep the container running)
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
