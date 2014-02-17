sudo apt-get update
sudo apt-get -y install euca2ools python-novaclient

cd /home/ubuntu
sudo echo "NOVA_API_HOST=172.16.0.1" >>keystonerc
sudo echo "KEYSTONE_API_HOST=172.16.0.1" >>keystonerc
sudo echo "KEYSTONE_TENANT="cookbook"" >>keystonerc
sudo echo "KEYSTONE_USERNAME="demo"" >>keystonerc
sudo echo "KEYSTONE_PASSWORD="project"" >>keystonerc
sudo echo "NOVA_REGION="RegionOne"" >>keystonerc

sudo echo "export NOVA_USERNAME=\$KEYSTONE_USERNAME">>keystonerc
sudo echo "export NOVA_PROJECT_ID=\$KEYSTONE_TENANT">>keystonerc
sudo echo "export NOVA_PASSWORD=\$KEYSTONE_PASSWORD">>keystonerc
sudo echo "export NOVA_API_KEY=\$KEYSTONE_PASSWORD">>keystonerc
sudo echo "export NOVA_REGION_NAME=\$NOVA_REGION">>keystonerc
sudo echo "export NOVA_URL="http://\${NOVA_API_HOST}:5000/v2.0/"">>keystonerc
sudo echo "export NOVA_VERSION="1.1"">>keystonerc

sudo echo "export OS_AUTH_USER=\$KEYSTONE_USERNAME">>keystonerc
sudo echo "export OS_AUTH_KEY=\$KEYSTONE_PASSWORD">>keystonerc
sudo echo "export OS_AUTH_TENANT=\$KEYSTONE_TENANT">>keystonerc
sudo echo "export OS_AUTH_URL="http://\${KEYSTONE_API_HOST}:5000/v2.0/"">>keystonerc
sudo echo "export OS_AUTH_STRATEGY="keystone"">>keystonerc

cd

. keystonerc

nova list
nova credentials

