!#/bin/bash

#1.To create a user in the cookbook tenant, we first need to get the cookbook tenant ID. To do this, issue the following command, which we conveniently store in a variable named TENANT_ID with the tenant-list option:

TENANT_ID=$(keystone tenant-list | awk '/\ cookbook\ /{print $2}')

#2.Now that we have the tenant ID, creation of the admin user in the cookbook tenantis done as follows, using the user-create option, choosing a password for the user:

PASSWORD=project

keystone user-create --name admin --tenant_id $TENANT_ID --pass$PASSWORD --email root@localhost --enabled true


#3.As we are creating the admin user, to which we are assigning the admin role, we need the admin role ID. In a similar way to the discovery of the tenant ID in step 1, we pick out the ID of the admin role and conveniently store it in a variable to use when assigning the role to the user with the role-list option:

ROLE_ID=$(keystone role-list | awk '/\ admin\ /{print $2}')

#4.To assign the role to our user, we need to use the user ID that was returned when we created that user. To get this, we can list the users and pick out the ID for that particular user with the following user-list option:

USER_ID=$(keystone user-list | awk '/\ admin\ /{print $2}')

#5.Finally, with the tenant ID, user ID, and an appropriate role ID available, we can assign that role to the user, with the following user-role-add option:

keystone user-role-add --user $USER_ID --role $ROLE_ID --tenant_id $TENANT_ID

#6.To create the demo user in the cookbook tenant with the Member role assigned we repeat the process as defined in steps 1 to 5:
# Get the cookbook tenant ID

TENANT_ID=$(keystone tenant-list | awk '/\ cookbook\ /{print $2}')

# Create the user

PASSWORD=project

keystone user-create --name demo --tenant_id $TENANT_ID --pass $PASSWORD --email demo@localhost --enabled true

# Get the Member role ID
ROLE_ID=$(keystone role-list | awk '/\ Member\ /{print $2}')

# Get the demo user ID

USER_ID=$(keystone user-list | awk '/\ demo\ / {print $2}')

# Assign the Member role to the demo user in cookbook

keystone user-role-add --user $USER_ID --role $ROLE_ID --tenant_id $TENANT_ID

keystone tenant-list

keystone role-list

keystone user-list

exit
