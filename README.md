# MRBS Ldap SetUp for LNL

## Repository Information

This repository provides instructions for setting up a machine to host an LN(Layered Network) site. The crucial information for machine setup can be found in the **setUpVM.txt** file, which offers a detailed, step-by-step guide, from the initial installation to configuring it for MRBS (Meeting Room Booking System) use.

## Setting Up MRBS with LDAP Integration

For integrating MRBS with LDAP (Lightweight Directory Access Protocol) and making specific configuration changes, you can refer to the **settingUpMRBSLdap.txt** file. This document outlines the modifications required to meet certain requirements:

1. **Access Control**: Ensure that only logged-in users can access the website.
2. **LDAP Authentication**: Set up LDAP server-based authentication for user login.
3. **Role-Based Permissions**: Restrict calendar modification to a specified group of users, as defined in the configuration file. Other users can only view the calendar.

## Automation Script: `MRBSLdapRoleSetUp.sh``

To simplify the process of making the required modifications as detailed in **settingUpMRBSLdap.txt**, we've provided the `MRBSLdapRoleSetUp.sh` script. Here are the steps to execute it:

1. Navigate to the web directory of MRBS (the same directory as **config.inc.php**).
    * If you just installed MRBS there will be no **config.inc.php** but just **config.inc.php-sample**. Rename it: `mv config.inc.php-sample config.inc.php`

2. Copy the MRBSLdapRoleSetUp.sh file here.
3. Give it the permissions: `chmod +rx MRBSLdapRoleSetUp.sh`

4. Run the script using the following command:

```bash
./MRBSLdapRoleSetUp.sh 
```

This script streamlines the configuration changes, making it easier to set up MRBS with LDAP integration and role-based access control.
