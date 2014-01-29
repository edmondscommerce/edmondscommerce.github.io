---
layout: post
status: publish
published: true
title: Magento Merged CSS Clear Not Working + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2737
wordpress_url: http://www.edmondscommerce.co.uk/?p=2737
date: 2011-11-18 18:42:27.000000000 +00:00
categories:
- magento
tags:
- Cascading Style Sheets
- magento
- file
- update
- solution
- change
- cache
- tip
- clear
- media
---
If you are having an issue with Magento and the optional Merge CSS Files (beta) turned on and it not updating with recent CSS changes, you may appreciate this.

Unlike other cached elements that are stored in var/cache, Magento stores the cached and minified CSS files in media/css

If you simply delete the contents of this folder, your CSS changes should kick in as Magento is forced to rebuild these files. 

There is an option in cache management to flush CSS storage but for some reason this wasn't working for me. Could be a permissions issue or something else I am not sure, we simply needed to get this change implemented (emergency live site fix) so flushing this folder manually did the trick.

Hope it helps someone else looking for Magento merged CSS clear not working, Magento CSS cache, Magento CSS Files beta
