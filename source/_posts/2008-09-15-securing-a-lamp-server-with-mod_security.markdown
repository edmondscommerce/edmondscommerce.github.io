---
layout: post
status: publish
published: true
title: Securing a LAMP Server with mod_security
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 72
wordpress_url: http://www.edmondscommerce.co.uk/blog/security/securing-a-lamp-server-with-mod_security/
date: 2008-09-15 13:09:44.000000000 +01:00
categories:
- security
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
To get the highest possible level of server security and to protect yourself from things like XSS attacks, Edmonds Commerce highly recommend you get mod_security set up on your server.

If you ask your hosts they should be able to do this for you.

You can read all about mod_security <a href="http://www.modsecurity.org/">here</a>. If you would like any help getting mod_security set up on your server then simply get in touch.

One thing we always recommend doing to the standard mod_security configuration is to increase the maximum body size. This restriction by default limits the size of any web page to 500k. 

For front end pages, there should never be a time when you need to display a page bigger than this size, however for some administration side systems, it is necessary to create very big pages. This mod_security limit will prevent these pages from being viewable.

To remedy this, you need to edit the file located in the modsecurity.d sub folder of your httpd folder (usually /etc/httpd/modsecurity.d/)

In this folder there is a collection of files which handle all of the various security rules that detect potential security threats. There is also a file called modsecurity_crs_10_config.conf.

Edit this file using vi and change the value for the SecResponseBodyLimit setting. We usually recommend upping this to 2mb from the standard .5mb. This means that the server is protected from doing really big things (for example a mysql dump) but is able to display really big admin side HTML pages.

To set it to 2mb you need to change the value of SecResponseBodyLimit to 2097152


