# docker

Spins up your docker container and allows you to specify a codebase for each container.  Each code base should have vhost.conf file which will be used when the container launches.

## rundocker

e.g.
  /path/to/somesite.com
  /path/to/othersite.com
  
> rundocker <port> <path>
> rundocker 80 /path/to/somesite.com
> rundocker 81 /path/to/othersite.com

vhost entry has only one requirement, the container document root, in this case, is /srv/www

## builddocker

Simple docker builder for the image. 

## post-load-runner

The bash script executed when the container is launched.  

## Dockerfile

The docker file.. obviously :)
