---
layout: post
status: publish
published: true
title: PHP Execution After Client Disconnection
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 112
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-execution-after-client-disconnection/
date: 2009-01-29 12:37:49.000000000 +00:00
categories:
- php
tags:
- php
- execution
- flush
- abort
- client
- disconnect
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
After a bunch of digging around and some help from the nice people on the #php channel on freenode IRC, I have cleared up the issue regarding PHP script execution and client connection.

If a client disconnects (closes the browser window / tab) and PHP subsequently tries to send information to the client but fails, the script stops executing.

Echoing does not necessarily mean sending information as PHP uses an output buffer. If you use the flush() function though you can force the buffer to be flushed to the client.

If you want to be sure a script will continue to execute when a client has disconnected, you can use the ignore_user_abort() function which will do exactly that.

Problem Solved :-)
