!# /bin/bash

sudo sed -i 's/127.0.0.1/172.16.0.1/g' /etc/glance/glance-registry-paste.ini

sudo sed -i 's/%SERVICE_TENANT_NAME%/service/g' /etc/glance/glance-registry-paste.ini

sudo sed -i 's/%SERVICE_USER%/glance/g' /etc/glance/glance-registry-paste.ini

sudo sed -i 's/%SERVICE_PASSWORD%/glance/g' /etc/glance/glance-registry-paste.ini

echo "[paste_deploy]">>/etc/glance/glance-registry.conf

echo "flavor = keystone">>/etc/glance/glance-registry.conf

sudo restart glance-api

sudo restart glance-registry

exit
