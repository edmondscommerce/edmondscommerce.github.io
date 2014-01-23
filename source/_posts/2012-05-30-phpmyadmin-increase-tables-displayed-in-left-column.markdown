---
layout: post
status: publish
published: true
title: phpMyAdmin Increase Tables Displayed in Left Column
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3112
wordpress_url: http://www.edmondscommerce.co.uk/?p=3112
date: 2012-05-30 10:49:15.000000000 +01:00
categories:
- php
tags:
- mysql
- php
- problem
- solution
- phpmyadmin
- tip
- top
---
If you are using the latest version of phpMyAdmin you have no doubt spotted the nice javascript table select system that allows you to type keywords that filter the list of tables down to the one you are looking for.

However if you are dealing with a system that has a lot of tables, the list is paged and unfortunately this javascript system does not filter the entire table list, just the current page.

The solution is to add one line to your config.inc.php in the phpMyAdmin root.

```php

$cfg['MaxTableList'] = 500;

```
