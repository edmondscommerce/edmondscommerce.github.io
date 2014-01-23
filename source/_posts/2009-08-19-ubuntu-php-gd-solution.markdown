---
layout: post
status: publish
published: true
title: Ubuntu + PHP + GD + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1158
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1158
date: 2009-08-19 09:50:34.000000000 +01:00
categories:
- php
tags:
- php
- ubuntu
- gd
- imagerotate
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are using PHP5 on Ubuntu and are having strange issues with missing functions including <strong>imagerotate()</strong> then you have come up against the problems created by the Ubuntu/Debian packagers decision not to include the GD library included with PHP5 but instead include a more purist version of the GD library which unfortunatley has some missing components.

<a href="http://cumu.li/2008/5/13/recompiling-php5-with-bundled-support-for-gd-on-ubuntu">Check out this blog story for the solution</a>

