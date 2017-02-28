#!/bin/bash -e

# $1: variable name
# $2: file name
function setvar() {
    value="${!1}"
    if test -z "$value"; then
	echo "**** ERROR: please specify -e '${1}=...'" 1>&2
	exit 1
    fi
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

setvar REALM authentication
setvar LDAPHOST authentication
setvar LDAPTLS authentication
setvar LDAPBASE authentication
setvar CHECKUSER authentication

sleep infinity

