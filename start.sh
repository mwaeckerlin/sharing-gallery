#!/bin/bash -e

# $1: variable name
# $2: file name
function setvar() {
    value="${!1}"
    sed -i 's/^ *\$'"${1,,}"' *= *"\(.*\)" *;/\$'"${1,,}"' = "'"${value//\//\\/}"'";/' /etc/sharing-gallery/${2}.php
}

if ! test -f /etc/sharing-gallery/password; then
    pwgen 32 1 > /etc/sharing-gallery/password
fi

setvar IMAGEPATH settings
setvar THUMBPATH settings
setvar MAX_VALIDITY_DAYS settings
setvar FONT settings
setvar PREVIEW_NUM settings
setvar DEFAULT_MAIL_SUBJECT settings
setvar DEFAULT_MAIL_TEXT settings
setvar DEFAULT_MAILTO settings
setvar FALLBACK_MAIL_REPLYTO settings

setvar REALM authentication
setvar LDAPHOST authentication
setvar LDAPTLS authentication
setvar LDAPBASE authentication
setvar CHECKUSER authentication

/start.php-fpm.sh
