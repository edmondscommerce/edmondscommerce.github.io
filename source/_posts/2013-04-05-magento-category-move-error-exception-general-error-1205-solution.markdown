---
layout: post
status: publish
published: true
title: 'Magento Category Move Error Exception General error: 1205 + solution'
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4215
wordpress_url: http://www.edmondscommerce.co.uk/?p=4215
date: 2013-04-05 15:44:14.000000000 +01:00
categories:
- magento
tags:
- problem
- magento problem
- solution
- indexes
- helpful tips
---
There is a problem in Magento that when you try to move a category by dragging it in the admin, it can cause the above error, whilst causing the rest of the site to slow down.

This is caused by the system trying to re-index every product within the space of a transaction.

An easy way to get round this is to switch the indexing mode from auto to manual and then move the categories.

You will still need to re-index the site, but this can be run on a cron when the site is quite.
