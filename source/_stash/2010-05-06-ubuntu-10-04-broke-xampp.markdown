---
layout: post
status: publish
published: true
title: Ubuntu 10.04 Broke XAMPP
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1640
wordpress_url: http://www.edmondscommerce.co.uk/?p=1640
date: 2010-05-06 10:37:47.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- apache
- xampp
- '10.04'
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
For some reason the upgrade seems to have installed Apache which then conflicts with my XAMPP apache.

This prevents me from starting the XAMPP apache. To fix this simply search for apache in Synaptic package manager and uninstall it. XAMPP apache should then start fine.
