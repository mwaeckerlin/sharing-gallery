# sharing-gallery
Docker Image for Sharing Gallery

    docker run -d --name sharing-gallery-php -v /home/marc/data/bilder:/data -e LDAPBASE="ou=People,dc=marc,dc=waeckerlin,dc=org" mwaeckerlin/sharing-gallery --link openldap:ldap mwaeckerlin/sharing-gallery
    docker run -d --name sharing-gallery-nginx -p 9000:80/tcp --volumes-from sharing-gallery-php --link sharing-gallery-php:php mwaeckerlin/nginx

