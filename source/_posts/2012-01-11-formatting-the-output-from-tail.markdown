---
layout: post
status: publish
published: true
title: Formatting the output from tail
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2837
wordpress_url: http://www.edmondscommerce.co.uk/?p=2837
date: 2012-01-11 16:27:41.000000000 +00:00
categories:
- linux
tags:
- grep
- logging
- bash
- sed
- tail
---
If you need to monitor a log file in real time, then using a combination of tail and grep will allow you to watch the important parts of the file. However if the log file spans more than one line then it can quickly become difficult to read. 

By using sed you are able to format the text so it is easier to read like this

<code>
tail -f /path/to/file | sed -u G | grep -A 1 searchTerm
</code>
