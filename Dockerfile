# Host a web app on apache ubuntu OS
FROM ubuntu:18.04

MAINTAINER KarthickH

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

WORKDIR /var/www/html

COPY index.html /var/www/html
ADD *.html /var/www/html

EXPOSE 80

SHELL ["/bin/sh", "-c"]
CMD ["apache2ctl", "-D", "FOREGROUND"]

