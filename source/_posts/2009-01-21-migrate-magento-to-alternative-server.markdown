---
layout: post
status: publish
published: true
title: Migrate Magento to Alternative Server
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 99
wordpress_url: http://www.edmondscommerce.co.uk/blog/magento/migrate-magento-to-alternative-server/
date: 2009-01-21 13:37:13.000000000 +00:00
categories:
- magento
tags:
- edmondscommerce
---
There are a few simple steps you need to take to move your Magento based store from one place to another.

First of all, create a full SQL dump of your store's database and import this to a database on the new server. To do this, simply use the backup functionality within the Magento Admin. If you use phpMyAdmin things can become a bit weird.

Then copy all files apart from the contents of the /var/ folder to the web root of the new server.

Once the DB and the files are all in place, you need to edit the database settings in app/etc/local.xml to reflect the settings of the new server

Then you need to actually edit the DB and update two fields. To find the fields to edit run this query:

```sql

SELECT * FROM core_config_data WHERE path = 'web/unsecure/base_url' OR path = 'web/secure/base_url'; 

```

Then update these two fields to reflect the new base URL.

That's it.

Originally stated in <a href="http://www.magentocommerce.com/boards/viewthread/27272/" rel="nofollow">this helpful forum post</a>
