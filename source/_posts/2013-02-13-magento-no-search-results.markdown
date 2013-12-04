---
layout: post
status: publish
published: true
title: Magento No Search Results
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 3935
wordpress_url: http://www.edmondscommerce.co.uk/?p=3935
date: 2013-02-13 16:46:00.000000000 +00:00
categories:
- magento
tags:
- development
- problem
- magento
- search
- solution
---
Sometimes Magento will some times return no results with the message "Your search returns no results" for terms that you would expect it to return many results for.
This can happen for a number of reasons including misconfiguration of search or attributes.

Unfortunately the way Magento speeds up search queries suffers from a race condition that can lead Magento to think it has cached a query when it has not and at the same time believes there are no products for that search because the cache for that query was dropped. This is a tough issue to solve but it can be done.

The two methods that work effectively to resolve the race condition problem (thus far) are to first make sure that the query cache isn't empty before using the cached results. This works effectively because if the cache is empty it must have been dropped recently and has not been repopulated.
The other thing you can do to help reduce this further is to make Magento remembers the time at which it dropped. Then have the query caches compare their last updated time against the the last cache drop time and if the update time is before or the same as the drop time don't use the cache.
If this isn't completely effective it is also possible to make it not use the query cache if the time of update and the time of drop are with in a minuet of each other to help reduce this further.
