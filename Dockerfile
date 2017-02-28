FROM mwaeckerlin/php-fpm
MAINTAINER mwaeckerlin

ENV IMAGEPATH "/data"
ENV THUMBPATH "/var/tmp/thumbnails"
ENV MAX_VALIDITY_DAYS "30"

ENV REALM "Authentication Needed"
ENV LDAPHOST "ldap"
ENV LDAPTLS "yes"
ENV LDAPBASE ""
ENV CHECKUSER "cn"
ENV FONT "DejaVu-Sans"
ENV PREVIEW_NUM "5"

RUN apt-get update && apt-get install -y pwgen sharing-gallery

RUN mkdir -p /usr/share/nginx
RUN ln -s /usr/share/sharing-gallery/html /usr/share/nginx/html

# Just provide /usr/share/sharing-gallery/html
VOLUME /etc/sharing-gallery
VOLUME /usr/share/sharing-gallery/html
VOLUME /usr/share/nginx/html

ADD start.sh /start.sh
CMD /start.sh
