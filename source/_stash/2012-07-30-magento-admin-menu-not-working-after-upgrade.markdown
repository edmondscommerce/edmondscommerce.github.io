---
layout: post
status: publish
published: true
title: Magento Admin Menu not working after Upgrade
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3158
wordpress_url: http://www.edmondscommerce.co.uk/?p=3158
date: 2012-07-30 09:39:07.000000000 +01:00
categories:
- magento
tags:
- web design
- web
- php
- zend framework
- magento
- upgrade
- sql
- solution
- script
---
Wondering why your Magento admin menu is not showing up after upgrading your live Magento store? 

If all attempts to get to a particular admin page with the exception of the dashboard proved abortive, this could be because there is a conflict between the Magento function that merges all Javascript files and the Apache URL rewrite.  This could be fixed by turning off this Magento function, and your can run the script below to do this.

```sql

UPDATE  `[your_magento_database_name]`.`core_config_data` SET  `value` =  '0' WHERE  `core_config_data`.`path` =`dev/js/merge_files`;

```
