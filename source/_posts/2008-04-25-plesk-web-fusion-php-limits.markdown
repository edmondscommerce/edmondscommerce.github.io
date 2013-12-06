---
layout: post
status: publish
published: true
title: Plesk Web Fusion PHP Limits
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 43
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/plesk-web-fusion-php-limits/
date: 2008-04-25 11:51:17.000000000 +01:00
categories:
- php
- hosting
- plesk
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
While recently migrating a client from a dedicated server which was proving a little too expensive over to one of the great value Linux Virtual Private Servers offered by Web Fusion, I found myself frustrated with the 2mb upload limit apparent in the control panel side of things.

So I went and edited the php.ini to allow for a more generous upload limit. Restarted the server but to no effect.

After a closer inspection I realised that the Plesk control panel actually had its own separate php.ini file. Edited this file and it works.

Another Problem Solved :-)
