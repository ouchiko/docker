
FROM ubuntu
MAINTAINER James Holden <ouchiko@gmail.com>
RUN apt-get update
RUN apt-get install -y -m vim python apache2
RUN mkdir /srv/www/
ADD post-load-runner /run.sh
RUN chmod 777 /run.sh
EXPOSE 80

