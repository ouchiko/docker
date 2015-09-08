
FROM ubuntu
MAINTAINER James Holden <ouchiko@gmail.com>
RUN apt-get install -y wget
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN sudo apt-key add rabbitmq-signing-key-public.asc
RUN apt-get update
RUN apt-get install -y -m apache2 php5 mysql-server php5-mysql vim php5-gd phantomjs rabbitmq-server python python-mysqldb python-amqp 
RUN chmod 777 /usr/bin/phantomjs
RUN mkdir /srv/www/
ADD mysql-configuration /etc/mysql/my.cnf
ADD mysql-login /login.sql
ADD post-load-runner /run.sh
RUN chmod 777 /run.sh
RUN rm -f /etc/apache2/sites-enabled/*
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
EXPOSE 80
EXPOSE 3306

