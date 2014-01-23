---
layout: post
status: publish
published: true
title: Magento Create Admin User Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2702
wordpress_url: http://www.edmondscommerce.co.uk/?p=2702
date: 2011-10-31 17:32:23.000000000 +00:00
categories:
- magento
tags:
- development
- php
- linux
- magento
- server
- developer
- password
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Often we will be asked to work on a site and have to test backend features but without asking for admin passwords, so we need a way to create admin users without admin access.  Of course we already have file and database access.

For this, we use phpmyadmin or adminer to give us database access and run the following php script at the commandline :-

```php
<?php 
function Readln() {
  $handle = fopen('php://stdin','r');
  return rtrim(fgets($handle),"\n");
}

echo 'Enter username [or hit enter for "someadminuser"]: ';
$username = Readln();
if ("" == $username) {
  $username = 'someadminuser';
}
echo "\n";
echo 'Enter password [or hit enter for the usual one]: ';
$password = Readln();
echo "\n";
echo 'Enter table prefix [or hit enter for none]: ';
$prefix = Readln();
echo "\n";
$salt = 'EC'; 
echo "Salted is : ";
if (!empty($password)) {
  echo $hash = md5($salt.$password).':'.$salt;
} else {
  echo $hash = '20f808df3d6e913ec43164ad2e7be85e:EC';
}
echo "\n\n";
echo "SQL for insert : \n";
echo <<< EOT
insert into ${prefix}admin_user
select
(select max(user_id) + 1 from ${prefix}admin_user) user_id,
'Edmonds' first_name,
'Commerce' last_name,
'nojunkplease@mailinator.com' email,
'$username' username,
'$hash' password,
now() created,
NULL modified,
NULL logdate,
0 lognum,
0 reload_acl_flag,
1 is_active,
(select max(extra) from ${prefix}admin_user where extra is not null) extra;
 
insert into ${prefix}admin_role
select
(select max(role_id) + 1 from ${prefix}admin_role) role_id,
(select role_id from ${prefix}admin_role where role_name = 'Administrators') parent_id,
2 tree_level,
0 sort_order,
'U' role_type,
(select user_id from ${prefix}admin_user where username = '$username') user_id,
'$username' role_name
\n
\n
EOT;
?>
```

The output looks like this :-
<code>Enter username [or hit enter for "someadminuser"]: 
Enter password [or hit enter for the usual one]: 
Enter table prefix [or hit enter for none]: 

Salted is : 20f808df3d6e913ec43164ad2e7be85e:EC

SQL for insert : 
insert into admin_user
select
(select max(user_id) + 1 from admin_user) user_id,
'Edmonds' first_name,
'Commerce' last_name,
'nojunkplease@mailinator.com' email,
'someadminuser' username,
'20f808df3d6e913ec43164ad2e7be85e:EC' password,
now() created,
NULL modified,
NULL logdate,
0 lognum,
0 reload_acl_flag,
1 is_active,
(select max(extra) from admin_user where extra is not null) extra;
 
insert into admin_role
select
(select max(role_id) + 1 from admin_role) role_id,
(select role_id from admin_role where role_name = 'Administrators') parent_id,
2 tree_level,
0 sort_order,
'U' role_type,
(select user_id from admin_user where username = 'someadminuser') user_id,
'someadminuser' role_name</code>

Which we can then copy and paste into the database admin.  No prizes for guessing the first programming language of the dev who wrote the script.
