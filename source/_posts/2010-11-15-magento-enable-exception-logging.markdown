---
layout: post
status: publish
published: true
title: Magento Enable Exception Logging
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1908
wordpress_url: http://www.edmondscommerce.co.uk/?p=1908
date: 2010-11-15 14:55:19.000000000 +00:00
categories:
- magento
tags:
- magento
- exception
- logging
- debug
- configuration
- logs
- enable
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Magento has some great exception logging functionality which is invaluable when trying to figure out why things aren't working.

However, like a lot of settings in Magento, its tucked away in the configuration and its not always easy to remember how to enable it.

So here it is:

System->Configuration->Developer->Log Settings

Once its enabled, the log files will be created in /var/logs/

