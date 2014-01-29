---
layout: post
status: publish
published: true
title: Magento Add Order Status History Comment
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2119
wordpress_url: http://www.edmondscommerce.co.uk/?p=2119
date: 2011-02-07 16:30:12.000000000 +00:00
categories:
- magento
tags:
- magento
- order
- status
- history
- comment
---
Adding an order status history comment to a Magento order object is easy, when you know how!

There is a very helpful Mage_Sales_Model_Order::addStatusHistoryComment() method which will take a comment and optional order status and either just save the comment or save the comment and update the order status.

However I found that it didn't quite work for me. Reading the docblock on the Mage_Sales_Model_Order::addStatusHistory() method, it turns out that it won't take effect unless the order object itself is saved.

So in a nutshell this is how to add a comment to an order in Magento

<script type="text/javascript" src="http://snipt.net/embed/4d4c11ac1ca65bc817bc92976958501a"></script>
