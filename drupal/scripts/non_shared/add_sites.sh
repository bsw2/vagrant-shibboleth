echo "******************* Adding to sites.php"

if [ -x /vagrant/.env ]; then
source /vagrant/.env
fi


SITENAME=${1:-mysite}

echo sed -i "\$s,\$,\n\$sites['drupal.example.org']='${SITENAME}';," /var/www/html/sites/sites.php
sed -i "\$s,\$,\n\$sites['drupal.example.org']='${SITENAME}';," /var/www/html/sites/sites.php
