!#/bin/bash

#1. Install the reqd the packages on client(Ubuntu Desktop)

sudo apt-get update

sudo apt-get -y install python-keystoneclient

#2. Now we ensure that our environment variables are set correctly to access OpenStack env.

export ENDPOINT=172.16.0.1

export SERVICE_TOKEN=ADMIN

export SERVICE_ENDPOINT=http://${ENDPOINT}:35357/v2.0

exit
