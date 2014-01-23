---
layout: post
status: publish
published: true
title: Mixed Content HTTPS Red Line SSL Google Chrome
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2933
wordpress_url: http://www.edmondscommerce.co.uk/?p=2933
date: 2012-02-13 17:11:45.000000000 +00:00
categories:
- debugging
tags:
- http
- browser
- chrome
- ssl
- https
- mixed
- mixed content
---
If Chrome is displaying mix content errors this means that Chrome thinks that some of the resources on the page where loaded over HTTP rather than HTTPS. But one behaviour of Chrome that might catch you out is that if Chrome at any point on a domain encountered a page with mixed content, it will then treat the whole site as having mixed content even if a given single page does not have mixed content. Chrome is unlikely to tell you this is the reason a single page has mixed content, the best way to tell is to keep closing chrome, starting a new session and browse until you get mixed content.
