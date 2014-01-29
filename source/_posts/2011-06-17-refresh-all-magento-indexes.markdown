---
layout: post
status: publish
published: true
title: Refresh all magento indexes
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2469
wordpress_url: http://www.edmondscommerce.co.uk/?p=2469
date: 2011-06-17 15:10:02.000000000 +01:00
categories:
- magento
tags:
- php
- magento
- cron
- script
- index
- task
- indexes
- rebuild
---
The indexes for your Magento site should be refreshed on a regular basis. To help you do this you can put the below code in a PHP file in the root of your web site and setup a scheduled task to call it periodically.

```php


require_once 'app/Mage.php';
$app = Mage::app('admin');
umask(0);
for ($i = 1; $i <= 8; $i++) {
    $process = Mage::getModel('index/process')->load($i);
    $process->reindexAll();
}

```
