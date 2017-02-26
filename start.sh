#!/bin/bash -e

# $1: variable name
# $2: file name
function setvar() {
    if test -z "${!1}"; then
	echo "**** ERROR: please specify -e '${1}=...'" 1>&2
	exit 1
    fi
    sed -i 's/^ *\$'${1,,}' *= *"\(.*\)" *;/'${1,,}' = "'${!1}'";/' /etc/${2}.php
}

setvar IMAGEPATH settings
setvar THUMBPATH settings
setvar MAX_VALIDITY_DAYS settings

setvar REALM authentication
setvar LDAPHOST authentication
setvar LDAPBASE authentication

sleep infinity

