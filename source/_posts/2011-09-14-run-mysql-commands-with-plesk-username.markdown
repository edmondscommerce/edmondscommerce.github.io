---
layout: post
status: publish
published: true
title: Run mysql commands with plesk username
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2633
wordpress_url: http://www.edmondscommerce.co.uk/?p=2633
date: 2011-09-14 15:33:04.000000000 +01:00
categories:
- plesk
tags:
- mysql
- security
- linux
- plesk
- auto
- password
- sysadmin
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
There's a little-known trick to using the plesk admin user password to access the mysql database that works on many a plesk machine.

Effectively the plesk admin password is stored in /etc/psa/.psa.shadow - in plain text.

This means that the following commands for instance work very well as root :
<ul>
	<li>mysql -uadmin -p`cat /etc/psa/.psa.shadow`</li>
	<li>mytop -uadmin -p`cat /etc/psa/.psa.shadow` -d[databasename]</li>
	<li>mysqldump --user=admin --password=`cat /etc/psa/.psa.shadow` [databasename] > /dev/null</li>
</ul>

Enjoy automating mysql stuff on your plesk servers! 
