FROM ubuntu
MAINTAINER mwaeckerlin
ENV TERM "xterm"
ENV LANG "en_US.UTF-8"

ENV PATH "/data"
ENV THUMBS "/var/tmp/thumbnails"
ENV MAX_VALIDITY_DAYS "30"

ENV REALM "Authentication Needed"
ENV LDAPHOST "ldap"
ENV LDAPBASE ""

RUN apt-get update
RUN apt-get install -y language-pack-en wget software-properties-common apt-transport-https
RUN apt-add-repository https://dev.marc.waeckerlin.org/repository
RUN wget -O- https://dev.marc.waeckerlin.org/repository/PublicKey | apt-key add -
RUN apt-get update -y
RUN apt-get install sharing-gallery

RUN mkdir -p /usr/share/nginx
RUN ln -s /usr/share/sharing-gallery/html /usr/share/nginx/html

# Just provide /usr/share/sharing-gallery/html
VOLUME /usr/share/sharing-gallery/html
VOLUME /usr/share/nginx/html

ADD start.sh /start.sh
ENTRYPOINT ["/start.sh"]
