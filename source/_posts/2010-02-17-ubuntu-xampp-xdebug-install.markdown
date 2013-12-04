---
layout: post
status: publish
published: true
title: Ubuntu XAMPP XDebug Install
author: kenny
author_login: kenny
author_email: kenny@edmondscommerce.co.uk
wordpress_id: 1385
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1385
date: 2010-02-17 15:40:42.000000000 +00:00
categories:
- ubuntu
tags:
- ubuntu
- xampp
- xdebug
- xdebug install
- xdebug linux
- xdebug ubuntu
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
<strong>1]</strong> Download the latest version of ( XAMPP For Linux ) <a href='http://www.apachefriends.org/en/xampp-linux.html'>here</a>
<strong>2]</strong> Install it. To install lampp, extract and put in /opt directory. Remember to extract it as ROOT.
<strong>3]</strong> Download Development package from same site.
<strong>4]</strong> Extract it, copy and paste "include" folder from Development package to /opt/lampp directory. ( This package would use for compiling XDebug source )
<strong>5]</strong> Run command;  sudo /opt/lampp/bin/pecl update-channels. this would update the pecl channels database at your local pc.
<strong>6]</strong> Run command sudo /opt/lampp/bin/pecl install Xdebug. And wait for finishing the process.
<strong>7]</strong> Now xdebug.so file has been created in /opt/lampp/lib/php/extensions/ directory.
<strong>8]</strong> Now Open the file php.ini and add the line zend_extension="/opt/lampp/lib/php/extensions/path_to_xdebug.so". at the end of file.
<strong>9]</strong> Restart Lampp &amp; Check enabled or not using phpinfo();

TESTING INSTALLATION::
======================

<strong>1]</strong> Ensure LAMP is started/running (i.e apache, mysql)
<strong>2]</strong> Open your favorite browser i.e FireFox
<strong>3]</strong> Type http://localhost (if all is well this should take you to the Xampp homepage and ask you to select your prefered language!. This ensures your htdocs web folder is reachable and web server is working fine.)
<strong>4]</strong> Type http://localhost/phpmyadmin (if all is well this should take you to the mysql admin homepage!. This ensures your mysql database is configured correctly and ready is ready to go!)

NOTE:
=====
If the installation is not done as root, you may experience few security issues while testing your installation:

- http://localhost - may throw errors relating to permissions while trying to open files notably 'lang.tmp.php'
- http://localhost/phpmyadmin - may throw errors relating to not been able to read 'config.php' and also connection to mysql database may fail.

Solution:
=========
Re-Install lampp as root to eliminate such problems.

Thanks to: <a href='http://www.webhelp2u.com/article/install-xdebug-on-lampp'>http://www.webhelp2u.com/article/install-xdebug-on-lampp</a>
