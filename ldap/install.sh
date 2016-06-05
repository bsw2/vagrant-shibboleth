#!/bin/sh
debconf-set-selections <<EOF
slapd slapd/password1 password secret
slapd slapd/internal/adminpw password secret
slapd slapd/password2 password secret
slapd slapd/internal/generated_adminpw password secret
slapd slapd/domain string andrew.cmu.edu
slapd shared/organization string andrew.cmu.edu
EOF
DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils
ldapadd -x -D cn=admin,dc=andrew,dc=cmu,dc=edu -w secret -f /vagrant/ldap/dit.ldif
