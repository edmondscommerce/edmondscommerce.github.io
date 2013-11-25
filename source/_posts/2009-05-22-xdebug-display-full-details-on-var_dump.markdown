---
layout: post
status: publish
published: true
title: Xdebug Display Full Details on var_dump()
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 404
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=404
date: 2009-05-22 14:03:52.000000000 +01:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Xdebug is an excellent addition to a PHP developers arsenal. However when debugging large arrays etc, the truncating can get in the way.

To stop Xdebug truncating arrays etc when you dump them using var_dump, just make these two additions to your php.ini file:

```

xdebug.var_display_max_data=9999999999
xdebug.var_display_max_children=9999999999

```

For a fuller explanation of Xdebug check out <a href="http://devzone.zend.com/article/2803" rel="nofollow">this article</a>
