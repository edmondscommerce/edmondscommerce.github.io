---
layout: post
status: publish
published: true
title: Format searched log files
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3277
wordpress_url: http://www.edmondscommerce.co.uk/?p=3277
date: 2012-08-16 15:45:56.000000000 +01:00
categories:
- bash
tags:
- development
- server
- debugging
- shell
- bash
- sed
- tail
---
When you are monitoring a log file you may want to narrow it down, and format the results. This simple one line command will break up the output from a log file to make it easier to quickly read

<code>
tail -f /path/to/log | grep "search term" | sed 's/\(.*\)/----------\n\1\n----------/'
</code>
