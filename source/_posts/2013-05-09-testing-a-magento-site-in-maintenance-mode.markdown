---
layout: post
status: publish
published: true
title: Testing a Magento site in maintenance mode
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4256
wordpress_url: http://www.edmondscommerce.co.uk/?p=4256
date: 2013-05-09 12:15:23.000000000 +01:00
categories:
- magento
tags:
- magento
- server
- maintenance mode
---
Often you'll have your site in maintenance mode, but obviously before you show your changes to the world you'll want to check the site over.

The best way to set Magento into Maintenance Mode is to add a maintenance.flag file to the web root, and there's a snippet of code in Magento's index.php which handles this:

```php


$maintenanceFile = 'maintenance.flag';

...

if (file_exists($maintenanceFile)) {
    include_once dirname(__FILE__) . '/errors/503.php';
    exit;
}


```

You'll want to set this to also take your IP address into consideration, so just make the following amends and you'll have added conditional maintenance mode:

```php


$maintenanceFile = 'maintenance.flag';

...

if (file_exists($maintenanceFile) &amp;&amp; $_SERVER['REMOTE_ADDR'] != &quot;123.123.123.123&quot;) {
    if($_SERVER['REMOTE_ADDR'] == &quot;123.123.123.123&quot;) {
        //Do nothing, but it's safer to check if it *is* your IP than *isn't*
    }
    else {
        include_once dirname(__FILE__) . '/errors/503.php';
        exit;
   }
}


```
