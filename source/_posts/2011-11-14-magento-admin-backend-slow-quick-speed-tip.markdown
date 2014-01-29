---
layout: post
status: publish
published: true
title: Magento admin backend slow (quick speed tip)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2726
wordpress_url: http://www.edmondscommerce.co.uk/?p=2726
date: 2011-11-14 12:48:00.000000000 +00:00
categories:
- magento
tags:
- speed
- php
- ubuntu
- linux
- problem
- hosting
- solution
- debugging
---
One of the things that can catch you out if you have a paranoid server admin is that various magento extensions will contact external servers (such as SagePay or Mailchimp).

If the server admin has blocked outbound web traffic (to avoid DDoS attacks and other malicious traffic), these extensions will slow you down at every step.

Simple answer, if you're running magento, ensure you have outbound traffic enabled.  Also, don't assume that just because you can use lynx, apt-get et al at the command prompt that you can as the web server user.  IPTables and pf both have checks for outbound user, so be sure to test as www-user or apache.
