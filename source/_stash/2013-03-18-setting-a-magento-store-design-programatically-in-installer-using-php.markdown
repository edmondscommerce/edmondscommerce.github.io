---
layout: post
status: publish
published: true
title: Setting a Magento Store Design Programatically in Installer using PHP
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4152
wordpress_url: http://www.edmondscommerce.co.uk/?p=4152
date: 2013-03-18 12:13:21.000000000 +00:00
categories:
- magento
tags:
- edmondscommerce
---
I needed to set up a design change for a new store which I was programatically creating. One aspect which I was still doing manually was the design change. Lots of tutorials on the web suggest how to accomplish this in the Admin, but this wasn't what I was after.

I've done this by updating the store's config as shown below. Hope it helps someone out there too

```php

$config = new Mage_Core_Model_Config();
$config->saveConfig('design/theme/template', <store name>, 'websites', storeId);
$config->saveConfig('design/theme/layout', <store name>, 'websites', storeId);
$config->saveConfig('design/theme/skin', <store name>, 'websites', storeId);

```
