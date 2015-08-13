
FROM ubuntu
MAINTAINER James Holden <james_holden@londonmarketing.com>
RUN apt-get update
RUN apt-get install -y apache2 php5 
#RUN mkdir /srv/www/
ADD post-load-runner /run.sh
RUN chmod 777 /run.sh
RUN rm -f /etc/apache2/sites-enabled/*
#ADD osfiles/vhost.conf /etc/apache2/sites-enabled/
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
EXPOSE 80

