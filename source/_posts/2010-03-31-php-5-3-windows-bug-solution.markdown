---
layout: post
status: publish
published: true
title: PHP 5.3 Windows Bug + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1587
wordpress_url: http://www.edmondscommerce.co.uk/?p=1587
date: 2010-03-31 15:42:02.000000000 +01:00
categories:
- php
tags:
- Windows
- php5.3
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Just got a heads up about a bug with PHP 5.3 and windows.

I don't actually use windows but on the off chance that I might in the future for some reason I thought I would make a note of the solution here.

The problem can be spotted by getting this error message:

<b>PHP Warning: mysqli::mysqli(): ```2002
 A connection attempt failed because the connected party did not (trying to connect via tcp://localhost:3306) in xxx.php on line 2
PHP Warning: mysqli::mysqli(): (HY000/2002): A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond.
in xxx.php on line 2</b>

The solution is this:

Edit your hosts file and comment out the Ipv6 line 

[code]#::1 localhost
```
