---
layout: post
status: publish
published: true
title: MySQL 5.1 to 5.5 Migration
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3436
wordpress_url: http://www.edmondscommerce.co.uk/?p=3436
date: 2012-09-18 11:09:09.000000000 +01:00
categories:
- mysql
tags:
- mysql
- linux
- upgrade
- developer
- sysadmin
---
According to pretty much every source there's only one sensible way to migrate from 5.0, 5.1 or 5.2 to 5.5 of mysql (or mariadb/percona for that matter), and it's not pretty (for a server with only two active magento installations for instance, this will take about 3 hours).

The answer is that you have to do an sql dump and restore.  This does take an age but does at least provide the reassurance that you are going to have nice clean databases after the upgrade.

So the commands are :-
```bash

mysqldump --all-databases --routines --events > fulldump.sql
mysqldump mysql --tables user > users.sql

```

Then upgrade mysql binaries to 5.5 and empty the database directory - such as /var/lib/mysql and start mysql with it's script (e.g. /etc/init.d/mysql start).   Note, if you're using a distribution that doesn't come with start scripts, you may want to run mysql_install as root before starting mysql however you start it.

Then the following will restore the databases and users :
```bash

mysql -u root # add -p if you set up a default password when upgrading/installing 5.5
\r mysql
source users.sql
source fulldump.sql
FLUSH PRIVILEGES;
\q

```

