---
layout: post
status: publish
published: true
title: Magento Redirect Loops
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1609
wordpress_url: http://www.edmondscommerce.co.uk/?p=1609
date: 2010-04-19 16:06:49.000000000 +01:00
categories:
- magento
tags:
- magento
- bst
- redirect loop
- cookies
---
If your Magento store is occasionally throwing up redirect loop errors in your web browser this might be your problem, and your solution.

It seems that Magento doesn't properly support British Summer Time as standard, so if you are using GMT then your times might be an hour out. That's not ideal but its not the end of the world. The problem arises in that the cookie lifespan is set to 1 hour by default. That means that as soon as a session cookie is set, it is expired and this can then send your browser into a redirect loop as cookies are set and expired successively.

The quick fix is simply to increase the cookie lifespan to something over 1 hour.

Another possible fix is detailed in this thread:
http://www.magentocommerce.com/boards/index.php/viewthread/16393/
