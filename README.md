# sharing-gallery
Docker Image for Sharing Gallery

    docker run -d --restart unless-stopped --name sharing-gallery -v /home/marc/data/bilder:/data --link openldap:ldap -e LDAPBASE="ou=People,dc=marc,dc=waeckerlin,dc=org" mwaeckerlin/sharing-gallery
    docker run -d --restart unless-stopped --name sharing-gallery-php --volumes-from sharing-gallery mwaeckerlin/php-fpm
    docker run -d --restart unless-stopped --name sharing-gallery-nginx -p 9000:80/tcp --volumes-from sharing-gallery --link sharing-gallery-php:php mwaeckerlin/nginx

