FROM ubuntu
MAINTAINER Ivan Kolbasiuk <kolbasyuk@gmail.com>

VOLUME ["/var/www"]

RUN apt update && \
    apt dist-upgrade -y && \
    apt install -y \
      apache2 
      
COPY apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

EXPOSE 80

