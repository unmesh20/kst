!#/bin/bash

#1.Before starting set env. variables.

export ENDPOINT=172.16.0.1

export SERVICE_TOKEN=ADMIN

export SERVICE_ENDPOINT=http://${ENDPOINT}:35357/v2.0

#1.Creation of a tenant called cookbook is done as follows:

keystone tenant-create --name cookbook --description "Default Cookbook Tenant" --enabled true

keystone tenant-list

exit
