---
layout: post
status: publish
published: true
title: 'mysql_dump not restored correctly 1064: USING BTREE + fix'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2724
wordpress_url: http://www.edmondscommerce.co.uk/?p=2724
date: 2011-11-10 18:30:05.000000000 +00:00
categories:
- mysql
tags:
- ubuntu
- linux
- problem
- magento
- server
- database
- error
- solution
- mysqldump
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
When migrating one server to another you often hit bumps in the road.  Todays was transferring a database from one server to another.

During this standard procedure I found that the restored database was missing a few tables.  Irritating as Magento doesn't like missing tables.

Digging down into the backup and extracting the first missing table I was able to replicate the error which came out as
<code>1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'USING BTREE</code>

I eventually found out that some versions of mysql 5.1 export a dump file that contains mysql5.1 specific features and loading the file into mysql 5.0 will not work.

The solution is a little frustrating but if you run the command with the --compatible=mysql40 switch, the dump file extracts fine :-
<code>mysqldump --compatible=mysql40</code>
Don't ask me why there's no --compatible=mysql50 flag.
