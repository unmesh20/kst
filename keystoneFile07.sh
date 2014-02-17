!# /bin/bash

#sudo echo "paste.filter_factory =keystone.middleware.auth_token:filter_factory" >>/etc/glance/glance-api-paste.ini

#sudo echo "service_protocol = http" >>/etc/glance/glance-api-paste.ini

sudo sed -i 's/127.0.0.1/172.16.0.1/g' /etc/glance/glance-api-paste.ini

#sudo echo "service_port = 5000" >>/etc/glance/glance-api-paste.ini

#sudo echo "auth_host = 172.16.0.1" >>/etc/glance/glance-api-paste.ini

#sudo echo "auth_port = 35357" >>/etc/glance/glance-api-paste.ini

#sudo echo "auth_protocol = http" >>/etc/glance/glance-api-paste.ini

#sudo echo "auth_uri = http://172.16.0.1:5000/" >>/etc/glance/glance-api-paste.ini

sudo sed -i 's/%SERVICE_TENANT_NAME%/service/g' /etc/glance/glance-api-paste.ini

sudo sed -i 's/%SERVICE_USER%/glance/g' /etc/glance/glance-api-paste.ini

sudo sed -i 's/%SERVICE_PASSWORD%/glance/g' /etc/glance/glance-api-paste.ini

echo "[paste_deploy]">>/etc/glance/glance-api.conf

echo "flavor = keystone">>/etc/glance/glance-api.conf

exit
