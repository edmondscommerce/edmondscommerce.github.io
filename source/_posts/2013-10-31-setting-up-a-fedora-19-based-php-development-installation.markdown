---
layout: post
status: publish
published: true
title: Setting up a Fedora 19 based PHP Development Installation
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4545
wordpress_url: http://www.edmondscommerce.co.uk/?p=4545
date: 2013-10-31 10:25:52.000000000 +00:00
categories:
- fedora
tags:
- edmondscommerce
---
I have decided to switch from Debian/Ubuntu/Mint which has served me very well over the last few years and move towards more of a RedHat based distribution as it seems that servers these days are more commonly CentOS or RedHat based and I always like to keep my development environment as close as I can to the server environment for all kinds of reason.

Also, I have decided that I really quite like Gnome Shell and it makes sense to pick a distribution that is properly bundled with Gnome Shell rather than bolting it into a distro after installation.

<h3>1. Install Apache and PHP 5.5</h3>
You need to become root first, stay as root for the rest of the steps.

```bash

su
rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm 
rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/remi-release-19.rpm
yum --enablerepo=remi install httpd php php-common
yum --enablerepo=remi install php-pecl-apc php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongo php-sqlite php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml

```

<h3>2. Set that to start up automatically (you are going to be developing none stop right?)</h3>

```bash

service httpd start
systemctl enable httpd.service

```

<h3>3. Create a test PHP file to confirm thats all working</h3>

Extra bit here, install <a href="http://vim.spf13.com/" target="_blank">this version of Vim</a>, its quite tasty:
```bash

curl http://j.mp/spf13-vim3 -L -o - | sh

```

Now create your PHP file:
```bash

vim /var/www/html/test.php

```
May as well just throw a phpinfo() in there
```php

<?php
phpinfo();

```
And now check it: <a href="http://localhost/test.php">http://localhost/test.php</a>

<h3>4. Finally lets get a MySQL version installed. Lets choose MariaDB</h3>
I tried Percona but it does not have a proper Fedora version. Then I discovered that Fedora have adopted MariaDB which is fine by me, lets go with the flow:

```bash

yum install mariadb mariadb-server
systemctl start mysqld.service
systemctl enable mysqld.service
/usr/bin/mysql_secure_installation

```

And that's it, next up is getting Java and PhpStorm installed and also phpMyAdmin 
