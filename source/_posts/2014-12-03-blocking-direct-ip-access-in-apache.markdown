---
layout: post
title: "Blocking Direct IP Access in Apache"
date: 2014-12-03 15:08:37 +0000
comments: true
author: joseph
categories: 
 - apache
tags: 
 - apache
 - linux
 - block
description: "How to block direct IP access to an Apache server"
---

If you are using Name based virtual hosts, you may want to simply block any bots etc that try to access your server by direct IP address. It's unlikely a real user would try to hit your server by using the actual IP address.

To do this, you can use this Virtual Host config:

```
<VirtualHost *:80>
    ServerName 123.123.123.123
    Redirect 403 /
    ErrorDocument 403 "No"
    DocumentRoot /dev/null/
    UseCanonicalName Off
    UserDir disabled
</VirtualHost>

```

Of course, please change the IP to the real server IP address(es)

And that's it, anyone trying to hit the server by IP address will get a simple 403 error.
