!# /bin/bash

sudo sed -i 's/127.0.0.1/172.16.0.1/g' /etc/nova/api-paste.ini

sudo sed -i 's/%SERVICE_TENANT_NAME%/service/g' /etc/nova/api-paste.ini

sudo sed -i 's/%SERVICE_USER%/nova/g' /etc/nova/api-paste.ini

sudo sed -i 's/%SERVICE_PASSWORD%/nova/g' /etc/nova/api-paste.ini

echo "--api-paste_config=/etc/nova/api-paste.ini">>/etc/nova/nova.conf

echo "--keystone_ec2_url=http://172.16.0.1:5000/v2.0/ec2tokens">>/etc/nova/nova.conf

echo "--auth_strategy=keystone">>/etc/nova/nova.conf

echo "It is important to remove the following line from /etc/nova/nova.conf: --use_deprecated_auth then sudo restart nova-api"

exit
