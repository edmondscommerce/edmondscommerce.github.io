---
layout: post
status: publish
published: true
title: PEAR not working for you, Open Basedir?
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1287
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1287
date: 2009-12-17 17:14:18.000000000 +00:00
categories:
- php
tags:
- php
- pear
- open_basedir
- phplist
- http/request
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you have dutifully installed the required PEAR libraries for your application (eg PHPList HTTP/Request) but its still saying that you haven't, see if you have an open_basedir restriction in place. 

If you do, there is a good chance that this is your problem.
