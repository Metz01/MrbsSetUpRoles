#!/bin/bash

file_to_modify="config.inc.php"
line_where_to_insert=2
ldap_info_setup='
$auth["type"] = "ldap";

// auth_ldap configuration settings
// Where is the LDAP server
$ldap_host = "ldaps://imap.lnl.infn.it";

// If you have a non-standard LDAP port, you can define it here
$ldap_port = 636;

// If you want to use LDAP v3, change the following to true
$ldap_v3 = false;

// If you want to use TLS, change following to true
$ldap_tls = false;

// LDAP base distinguish name
// See AUTHENTICATION for details of how check against multiple base dn s
$ldap_base_dn = "dc=lnl,dc=infn,dc=it";

// Attribute within the base dn that contains the username
$ldap_user_attrib = "uid";

'
# Use the awk command to insert the new code block at the desired position
awk -v new_code="$ldap_info_setup" -v line="$line_where_to_insert" 'NR==line{print new_code} 1' "$file_to_modify" > tmpfile && mv tmpfile "$file_to_modify"

max_level='$max_level = 3;'
echo "$max_level" >> "$file_to_modify"

file_to_modify="./lib/MRBS/Auth/AuthLdap.php"
line_where_to_insert=474
role_chooser='
global $auth;
if(in_array($user['username'], $auth['admin'])){
    $user['level'] = $max_level;
}else if(in_array($user['username'], $auth['user'])){
    $user['level'] = 2;
}else{
    $user['level'] = 1;
}

'


# Define the file to modify and the lines to replace
file_to_modify="mrbs_auth.inc"
line_numbers=(71 94 118 139)  # Replace lines 3, 5, and 7
replacement=('return 2;' '$result = 1;' '$result = $max_level;' '$result = $max_level;')  # Replacement lines

# Loop through line numbers and replacements
for i in "${!line_numbers[@]}"; do
  line_number="${line_numbers[i]}"
  new_line="${replacement[i]}"
  
  # Use sed to replace the line
  sed -i "${line_number}s/.*/$new_line/" "$file_to_modify"
done
