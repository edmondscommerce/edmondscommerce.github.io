---
layout: post
status: publish
published: true
title: 'Magento Post-upgrade: Illegal scheme supplied, only alphanumeric characters
  are permitted +SOLUTION'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3069
wordpress_url: http://www.edmondscommerce.co.uk/?p=3069
date: 2012-04-04 10:50:42.000000000 +01:00
categories:
- magento
tags:
- development
- magento
- upgrade
- multistore
- solution
---
So one of our customer's sites started throwing this error message immediately following an upgrade.
<code>Illegal scheme supplied, only alphanumeric characters are permitted</code>

Turns out 1.6.2.0 doesn't like anything other than a-z and 0-9 in the store run code and the customer in question had underscores (_) in the store run code.

The simple fix was to strip it out and alter the url to store code logic to match.

Hope this helps someone else out there.  As to why someone at magento thought this was a good idea is beyond me though.
