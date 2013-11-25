---
layout: post
status: publish
published: true
title: 'TIP: SSH add a tunnel to a running session'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3060
wordpress_url: http://www.edmondscommerce.co.uk/?p=3060
date: 2012-03-28 11:39:09.000000000 +01:00
categories:
- bash
tags:
- linux
- ssh
- command line
- bash
- tip
---
Useful tip - if you've ever been ssh'd into a remote machine and don't want to break the connection or open a new session just to add a new tunnel, there is a way

Press [return] then ~ then C to get to an ssh> prompt, then you can add tunnels as you would at the command line e.g.
<code>-L 80:localhost:8080</code>

Then press [return] to return to the session you were running.  Cool trick.
