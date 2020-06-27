FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install wget -y && \
    apt-get install curl -y && \
    apt-get install apache2 -y && \
    apt-get install docker.io -y && \
    apt-get install nano -y
    
    
RUN apt-get install -y php && \
    apt-get install -y php-mysql && \
    apt-get install -y php-pgsql && \
    apt-get install -y php-pear && \
    apt-get install -y php-gd && \
    apt-get clean

COPY simplebackdoor.php /var/www/html
COPY php-backdoor.php /var/www/html
COPY config.inc.php /var/www/html/config/

RUN service apache2 start
RUN echo "www-data ALL = NOPASSWD: ALL" >> /etc/sudoers

COPY main.sh /

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

ENTRYPOINT ["/main.sh"]
