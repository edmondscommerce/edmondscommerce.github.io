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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
While recently migrating a client from a dedicated server which was proving a little too expensive over to one of the great value Linux Virtual Private Servers offered by Web Fusion, I found myself frustrated with the 2mb upload limit apparent in the control panel side of things.

So I went and edited the php.ini to allow for a more generous upload limit. Restarted the server but to no effect.

After a closer inspection I realised that the Plesk control panel actually had its own separate php.ini file. Edited this file and it works.

Another Problem Solved :-)
