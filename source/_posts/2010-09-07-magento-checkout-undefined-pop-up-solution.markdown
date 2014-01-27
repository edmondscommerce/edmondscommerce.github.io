---
layout: post
status: publish
published: true
title: Magento Checkout "undefined" Pop Up + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1813
wordpress_url: http://www.edmondscommerce.co.uk/?p=1813
date: 2010-09-07 16:39:15.000000000 +01:00
categories:
- magento
tags:
- firefox
- magento
- checkout
- firebug
- undefined
- pop up
---
If you are struggling to understand why you are getting a popup on the Magento checkout with the simple message "undefined" then here is what you need to do.

1. Use Fire Fox and install the extension Firebug

2. Switch Firebug on and go to the console tab

3. Hit the place order button and you will see the HTML response to the AJAX request (how did we cope with AJAX before Firebug!!)

You should then see a meaningful error message telling you what is causing the problem and hopefully help you to fix it.
