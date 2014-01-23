---
layout: post
status: publish
published: true
title: phpMyAdmin Chrome Resizable Left Column + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2600
wordpress_url: http://www.edmondscommerce.co.uk/?p=2600
date: 2011-08-25 17:50:39.000000000 +01:00
categories:
- php
tags:
- firefox
- chrome
- solution
- phpmyadmin
- frame
- resize
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you use FireFox with phpMyAdmin you will be able to resize the left column as required by simply grabbing it with your mouse

However in Chrome that doesn't work.

The fix is surprisingly simple, you just need to edit the index.php file and set all the frameborder="0" to  frameborder="1"

Job done
