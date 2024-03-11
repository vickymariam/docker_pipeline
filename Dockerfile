# Use a Node.js base image with the desired version
FROM ubuntu:latest

#update and install apache
RUN apt update -y
RUN apt install apache2 -y

# Set the working directory
WORKDIR /var/www/html

# Copy the package.json and package-lock.json (or yarn.lock) to the working directory
COPY . /var/www/html/

# Set the ServerName in Apache configuration to suppress the warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expose the port on which the Node.js application will run
EXPOSE 80

# Command to start the application
CMD ["apache2ctl", "-D", "FOREGROUND"]
