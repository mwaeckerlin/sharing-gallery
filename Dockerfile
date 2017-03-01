FROM mwaeckerlin/php-fpm
MAINTAINER mwaeckerlin

ENV IMAGEPATH "/data"
ENV THUMBPATH "/var/tmp/thumbnails"
ENV MAX_VALIDITY_DAYS "30"
ENV FONT "DejaVu-Sans"
ENV PREVIEW_NUM "5"
ENV DEFAULT_MAIL_SUBJECT "Sharing Gallery: See my Fotos"
ENV DEFAULT_MAIL_TEXT "Fotos from my gallery:\n\npassword = PASSWORD\n\nlink: LINK\n\nRegards\nUSERNAME"
ENV DEFAULT_MAILTO ""
ENV FALLBACK_MAIL_REPLYTO ""


ENV REALM "Authentication Needed"
ENV LDAPHOST "ldap"
ENV LDAPTLS "yes"
ENV LDAPBASE ""
ENV CHECKUSER "cn"

ENV WEB_ROOT_PATH "/usr/share/sharing-gallery/html"

RUN apt-get update && apt-get install -y pwgen sharing-gallery postfix

ADD start.sh /start.sh
CMD /start.sh

VOLUME ${WEB_ROOT_PATH}
