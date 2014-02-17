!#/bin/bash

#Before we start anything Ensure that we have our environment set correctly to access our OpenStack environment:

export ENDPOINT=172.16.0.1

export SERVICE_TOKEN=ADMIN

export SERVICE_ENDPOINT=http://${ENDPOINT}:35357/v2.0

#1.Creation of the admin role is done as follows:# admin role

keystone role-create --name admin

#2.To create the Member role we repeat the step, specifying the Member role:# Member role

keystone role-create --name Member

#3.To check roles have been created

keystone role-list

exit
