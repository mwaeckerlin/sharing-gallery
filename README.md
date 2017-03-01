# sharing-gallery
Docker Image for Sharing Gallery

Share your images with friends, give registered LDAP users full access:

    docker run -d --name sharing-gallery-php \
               -v /home/marc/data/bilder:/data \
               -e LDAPBASE="ou=People,dc=marc,dc=waeckerlin,dc=org" \
               -e CHECKUSER="uid" \
               -e LDAPTLS="no" \
               --link openldap:ldap \
               mwaeckerlin/sharing-gallery
    
    docker run -d --name sharing-gallery-nginx -p 9000:80/tcp \
               --volumes-from sharing-gallery-php \
               --link sharing-gallery-php:php \
               mwaeckerlin/nginx
