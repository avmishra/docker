FROM ubuntu:14.04

MAINTAINER Avadhesh Mishra <avadhesh.mishra@gmail.com>

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get -yq install \
   curl \
   vim \
   apache2 \
   php5 \
   libapache2-mod-php5  \
   php5-fpm \
   php5-cli \
   php5-mysql \
   php5-pgsql \
   php5-sqlite \
   php5-redis \
   php5-apcu \
   php5-intl \
   php5-imagick \ 
   php5-mcrypt \
   php5-json \
   php5-gd \
   php5-curl \
   php5-odbc \
   php5-memcached \
   php5-memcache \
   memcached
   

RUN rm -rf /var/lib/apt/lists/*

COPY indfas.alice.conf /etc/apache2/sites-available/indfas.alice.conf
COPY indfas.bob.conf /etc/apache2/sites-available/indfas.bob.conf

RUN ln -s /etc/apache2/sites-available/indfas.alice.conf /etc/apache2/sites-enabled/indfas.alice.conf && \
    ln -s /etc/apache2/sites-available/indfas.bob.conf /etc/apache2/sites-enabled/indfas.bob.conf

WORKDIR /var/www/html/

EXPOSE 80
EXPOSE 443

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]

# build 
# docker build -t apache2-php5:29062016 .
# run docker
# docker run -d -p 9000:80 -v /var/www/:/var/www/html/ apache2-php5:29062016
