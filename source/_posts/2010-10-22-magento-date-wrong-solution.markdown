---
layout: post
status: publish
published: true
title: Magento date() Wrong + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1857
wordpress_url: http://www.edmondscommerce.co.uk/?p=1857
date: 2010-10-22 10:32:43.000000000 +01:00
categories:
- magento
tags:
- magento
- date
- bst
- time
- gmt
- utc
---
If you are finding that your calls to date() etc are displaying the wrong time then this is the solution for you.

Magento sets the internal time reference to UTC which does not account for daylight saving time adjustments.

To get the correct date for your store, you need to get the store time, so the correct method is like this:

```php

echo date('l, F j, Y, H:i:s', Mage::app()->getLocale()->storeTimeStamp()); 

```
