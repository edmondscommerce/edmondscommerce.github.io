---
layout: post
status: publish
published: true
title: Solution - Can't Log in to Magento Admin - No Error
author: martyn
author_login: martyn
author_email: info+martyn@edmondscommerce.co.uk
wordpress_id: 3728
wordpress_url: http://www.edmondscommerce.co.uk/?p=3728
date: 2012-12-04 14:35:36.000000000 +00:00
categories:
- magento
tags:
- web
- php
- problem
- magento
- developer
- error
- solution
- fix
- tip
---
If you pull down a <a title="Magento" href="http://www.edmondscommerce.co.uk/platforms/Magento">Magento</a> site to a local machine, and change the database core_config table to point to the local machine, and it appears to work fine until you try to login to the site admin, there can be many issues.

One of the most common ones though is not having a period (dot) in the host name - e.g. localhost/admin or martyn-desktop/admin - if you don't have the period, the cookies don't work properly and you end up in a login loop.

To fix it, make sure your machine is accessible via a domain with a period - e.g. martyn-desktop.local - by either editing your hosts file (/etc/hosts) or check your router - it possibly already adds a domain name like .config and set your path in core_config to the same.
