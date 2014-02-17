!#/bin/bash

#1.First, we set the service token and service endpoint, which point to the service port of our OpenStack Identity Service.

export ENDPOINT=172.16.0.1

export SERVICE_TOKEN=ADMIN

export SERVICE_ENDPOINT=http://${ENDPOINT}:35357/v2.0

#2.We can now define the actual services that OpenStack Identity Service needs to know about in our environment.
# OpenStack Compute Nova API Endpoint

keystone service-create --name nova --type compute --description 'OpenStack Compute Service'

# OpenStack Compute EC2 API Endpoint

keystone service-create --name ec2 --type ec2 --description 'EC2 Service'

# Glance Image Service Endpoint

keystone service-create --name glance --type image --description 'OpenStack Image Service'

# Keystone Identity Service Endpoint

keystone service-create --name keystone --type identity --description 'OpenStack Identity Service'

# Nova Volume Endpoint

keystone service-create --name volume --type volume --description 'Volume Service'

#3.After we have done this, we can add in the service endpoint URLs that these services run on. To do this, we need the ID that was returned for each of the service endpoints created in the previous step. This is then used as a parameter when specifying the endpoint URLS for that service.


# OpenStack Compute Nova API

ID=$(keystone service-list | awk '/\ nova\ / {print $2}')

PUBLIC="http://$ENDPOINT:8774/v2/\$(tenant_id)s"

ADMIN=$PUBLIC

INTERNAL=$PUBLIC

keystone endpoint-create --region RegionOne --service_id $ID --publicurl $PUBLIC --adminurl $ADMIN --internalurl $INTERNAL

# OpenStack Compute EC2 API

ID=$(keystone service-list | awk '/\ ec2\ / {print $2}')

PUBLIC="http://$ENDPOINT:8773/services/Cloud"

ADMIN="http://$ENDPOINT:8773/services/Admin"

INTERNAL=$PUBLIC

keystone endpoint-create --region RegionOne --service_id $ID --publicurl $PUBLIC --adminurl $ADMIN --internalurl $INTERNAL

# Glance Image Service
ID=$(keystone service-list | awk '/\ glance\ / {print $2}')

PUBLIC="http://$ENDPOINT:9292/v1"

ADMIN=$PUBLIC

INTERNAL=$PUBLIC

keystone endpoint-create --region RegionOne --service_id $ID --publicurl $PUBLIC --adminurl $ADMIN --internalurl $INTERNAL

# Keystone OpenStack Identity Service
ID=$(keystone service-list | awk '/\ keystone\ / {print $2}')

PUBLIC="http://$ENDPOINT:5000/v2.0"

ADMIN="http://$ENDPOINT:35357/v2.0"

INTERNAL=$PUBLIC
keystone endpoint-create --region RegionOne --service_id $ID --publicurl $PUBLIC --adminurl $ADMIN --internalurl $INTERNAL

# Nova Volume

ID=$(keystone service-list | awk '/\ volume\ / {print $2}')

PUBLIC="http://$ENDPOINT:8776/v1/%(tenant_id)s"

ADMIN=$PUBLIC

INTERNAL=$PUBLIC

keystone endpoint-create --region RegionOne --service_id $ID --publicurl $PUBLIC --adminurl $ADMIN --internalurl $INTERNAL

exit


