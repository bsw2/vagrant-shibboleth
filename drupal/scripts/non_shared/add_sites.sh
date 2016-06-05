echo "******************* Adding to sites.php"

if [ -x /vagrant/.env ]; then
source /vagrant/.env
fi


SITENAME=${1:-mysite}

echo sed -i "\$s,\$,\n\$sites['drupal.andrew.cmu.edu']='${SITENAME}';," /var/www/html/sites/sites.php
sed -i "\$s,\$,\n\$sites['drupal.andrew.cmu.edu']='${SITENAME}';," /var/www/html/sites/sites.php
