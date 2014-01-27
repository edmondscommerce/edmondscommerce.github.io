---
layout: post
status: publish
published: true
title: Magento HomePage Layout All Messed Up + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1944
wordpress_url: http://www.edmondscommerce.co.uk/?p=1944
date: 2010-12-01 11:47:06.000000000 +00:00
categories:
- magento
tags:
- design
- magento
- cms
- broken
- solution
- layout
- home
- page
---
If you are making some design changes to your store and all of a sudden your home page has gone totally messed up then this might be your solution.

When working with designs and design packages in Magento you must remember that design packages are referenced not only in the System->Configuration or System->Design sections, but also on a per product or per CMS page basis as well.

So if you remove, rename or otherwise alter a design package then its going to cause problems.

If you are having issues - remember to not just look at the layout files etc, but also look in the admin CMS section and check what design package settings you have there.

This one is very simple to fix once you have figured out what's causing it, but can take hours of frustration if you get rail roaded into examining the files for the issue.
