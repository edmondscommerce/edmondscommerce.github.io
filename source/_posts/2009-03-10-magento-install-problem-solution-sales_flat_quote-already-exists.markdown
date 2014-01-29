---
layout: post
status: publish
published: true
title: Magento Install Problem + Solution 'sales_flat_quote' already exists
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 210
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=210
date: 2009-03-10 14:48:16.000000000 +00:00
categories:
- magento
tags:
- magento install
- magento problem
---
Trying to do a clean install of Magento 1.2.1.2 I kept hitting this SQL error.

<strong>Base table or view already exists: 1050 Table 'sales_flat_quote' already exists</strong>

In the end I opted to manually edit the related install file and add DELETE IF EXISTS statements before each CREATE TABLE statement.

The file in question is located here:

<strong>/app/code/core/Mage/Sales/sql/sales_setup</strong>

and the problem file is

<strong>mysql4-install-0.9.0.php</strong>

The solution is to edit the file and add DROP TABLE IF EXISTS statements before each CREATE TABLE statement

eg

```php

DROP TABLE IF EXISTS  `{$installer->getTable('sales_flat_quote')}`;

CREATE TABLE `{$installer->getTable('sales_flat_quote')}` (.....

```

I have created an issue on their bug tracker <a href="http://www.magentocommerce.com/bug-tracking/issue/?issue=5517" rel="nofollow">here</a>.

<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.pixelinternet.co.uk/blog/106/installing-magento/" rel="nofollow"><b>Installing Magento</b>, <b>Magento Installation</b> | Web Hosting Blog from <b>...</b></a><br><a href="http://zee.balogh.sk/?p=1010" rel="nofollow">Zee&#39;s Blog » <b>Magento Install</b> for Impatient</a><br><a href="http://www.mytestbox.com/e-commerce-software-reviews/magento-new-e-commerce-software-solution/comment-page-1/" rel="nofollow"><b>Magento</b> - the newest e-commerce package to hit the market <b>...</b></a><br><a href="http://www.inacode.com/magento/magento-speed-problem" rel="nofollow">Ina Code Blog » Blog Archive » <b>Magento</b> speed <b>problem</b></a><br><a href="http://www.casualcommerce.com/2009/02/magento-notes-fix-for-admin-login-problem/" rel="nofollow">Casual Commerce » <b>Magento</b> Notes - Fix for admin login <b>problem</b></a><br></div>
