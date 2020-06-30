FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install apache2 -y && \
    
    
COPY login.html /var/www/html
#COPY config.inc.php /var/www/html/config/

RUN service apache2 start

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

#ENTRYPOINT ["/main.sh"]
