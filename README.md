# docker

Spins up your docker container and allows you to specify a codebase for each container.  Each code base should have vhost.conf file which will be used when the container launches.

## rundocker

In this example we have two code sets we want to use.

```bash
/path/to/somesite.com
/path/to/othersite.com
```

To launch these we simply set off the container with the different paths.
  
```bash
rundocker <port> <path>
rundocker 80 /path/to/somesite.com
rundocker 81 /path/to/othersite.com
```

Each site path must contain a vhost.conf file which the container will bring in and use when launched.  The only criteria for the conf is that the DocumentRoot must be /srv/www

```
<VirtualHost *:80>
  ServerAdmin webmaster@localhost
  DocumentRoot /srv/www
	<Directory /srv/www>
	    Options Indexes FollowSymLinks
	    AllowOverride None
	    Require all granted
	</Directory>
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

## builddocker

Simple wrapper for building the container.

```
docker build -t <image:version> .
```

## post-load-runner

The bash script executed when the container is launched. In this instance it simply copies the vhost.conf across from the code base into apache, brings up apache.  Obviously you can launch more services etc within this for your requirements.

## Dockerfile

The docker file.. obviously :)
