---
layout: post
status: publish
published: true
title: SSH / Command Line Mysql Dump and Compress
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 107
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=107
date: 2009-01-28 10:28:57.000000000 +00:00
categories:
- mysql
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Some times you are working on a database that is just too big to export and import via phpMyAdmin. In those circumstances the best alternative is to use the Linux command line, usually via SSH.

If you want to be able to download the file easily via FTP, you need to first of all go to your web root. For example:
```

cd /home/myhome/public_html

```
If you are not sure where you web root is, you can log in via FTP and copy the path displayed in the remote pane of the FTP programme.

Then to create the database dump run the following command, replacing the dbuser and dbname with the mysql username and the name of the database you want to back up.
```

mysqldump --opt -u dbuser -p dbname > dbname.sql

```

You will then be prompted to enter the password for that mysql user. Enter this and mysql will then create an SQL dump file in your web root. 

If the dump file is really big, it is usually a good idea to then compress this file to make moving it around a bit easier. To create a gzip compressed copy of the file, use the following command, replacing dbname.sql with the actual database name you used.
```

gzip -c dbname.sql>dbname.sql.gz

```

At this point you might decide to delete the uncompressed SQL file to conserve space. To do that run the following command, again replacing dbname.sql with the actual name of the database.
```

rm -f dbname.sql

```
