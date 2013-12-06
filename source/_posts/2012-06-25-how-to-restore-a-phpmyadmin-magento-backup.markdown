---
layout: post
status: publish
published: true
title: How to restore a phpmyadmin magento backup
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3156
wordpress_url: http://www.edmondscommerce.co.uk/?p=3156
date: 2012-06-25 12:20:33.000000000 +01:00
categories:
- magento
tags:
- mysql
- php
- magento
- tip
---
So, if you've ever had the situation where the only backup of a magento database has been done through phpmyadmin (hint: don't do this, use the inbuilt backup tool or lightbackup magento extension), you need to set up some magic at the top and bottom of the dump files :-

Add the following at the top :-
<code>SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0;</code>

and the following at the bottom :
<code>SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
SET SQL_NOTES=@OLD_SQL_NOTES;</code>

This can also be done if you use some other backup systems (we've seen a table-per-file system too), in that instance, we created 00-head.sql and zz-foot.sql containing the above and create a single backup with 'cat *.sql > all.sql' before restoring.
