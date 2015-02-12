---
layout: post
title: "Varnish and Nginx redirecting to port 8080"
date: 2015-01-23 15:22:43 +0000
comments: true
author: michael
categories: 
- nginx
- varnish
tags:
- nginx
- varnish
description: Running nginx and varnish together is causing some or all redirects to have port 8080 on them 
---

So theres a strange problem where any redirects are going port 8080 when running your web application or site under varnish and nginx. Now arroung the web the solution apears to have varnish listen locally on port 80 while leaving nginx to listen on port 80 for any network addresses. The issue is that nginx when doing a redirect will add the port automatically to any redirect specified in nginx or is triggered from php, this is so that you dont have to ajust your rewrites if you are running on a non standard web port. But in the case of running varnish on top we dont want this behaviour to happen.

To stop this in the location, server or http context of your nginx config. Simply add:

``` bash
port_in_redirect off;
```

As by default according to the [nginx documentation](http://nginx.org/en/docs/http/ngx_http_core_module.html#port_in_redirect) this behaviour is on by default.


