---
layout: post
status: publish
published: true
title: Magento Huge Database? - Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1209
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1209
date: 2009-10-21 15:03:14.000000000 +01:00
categories:
- magento
tags:
- edmondscommerce
---
If your Magento database has swelled to truly gargantuan proportions, then perhaps you have suffered the same fate as a recent client. Magento happily logs all kinds of data to a collection of tables beginning with the prefix log_

It is possible to configure Magento to clean out these logs on a regular basis as part of its Cron schedule (you have created a cron job to run the cron.php script haven't you?). Alternatively, it seems you can disable logging altogether simply by going to the admin then in the system menu, select config. 

At the bottom you will see a link to advanced. In this section you can disable selected Magento modules, one of which is Mage_Log.

Problem solved
