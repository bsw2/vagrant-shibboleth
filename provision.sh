. ./config

vagrant up ldap --no-provision
vagrant provision ldap --provision-with base,fixroutes,install # debug

vagrant up sp  --no-provision
vagrant provision sp --provision-with base,dev,fixroutes,install,config,eds
SSO=${SSO} vagrant provision sp --provision-with sso

vagrant up drupal  --no-provision
vagrant provision drupal --provision-with base,dev,fixroutes,install,drupal,config,eds
SSO=${SSO} vagrant provision drupal --provision-with sso

if [ "${IDP2}" == "enabled" ]; then
  vagrant up idp 
  vagrant provision drupal --provision-with metadata-idp
fi

if [ "${IDP3}" == "enabled" ]; then
  vagrant up idp3
  vagrant provision drupal --provision-with metadata-idp3
fi

