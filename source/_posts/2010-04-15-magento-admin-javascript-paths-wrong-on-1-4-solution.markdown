---
layout: post
status: publish
published: true
title: Magento Admin Javascript Paths Wrong on 1.4 + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1605
wordpress_url: http://www.edmondscommerce.co.uk/?p=1605
date: 2010-04-15 15:55:58.000000000 +01:00
categories:
- magento
tags:
- javascript
- magento
- '1.4'
- admin
- merge_js
---
If you upgrade to Magento version 1.4 and find that your admin totally stops working then this might be for you.

If you view source and notice that your javascript paths are totally wrong then it could be that Merge JavaScript Files is causing it.

The answer is:

go to System -> Configuration -> Developer Settings -> Javascript Settings -> Merge JavaScript Files (beta) and set it to "no". It is realy a beta :D

However - you can't because your admin it totally not working..

So the other answer is to go to the core_config_data table and set the path dev/js/merge_files to 0

However - on checking ours, that row was not even in the core_config_data table.

The final solution was to add a new row, setting the path to dev/js/merge_files and the value to 0.
