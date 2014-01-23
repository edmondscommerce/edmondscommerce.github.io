---
layout: post
status: publish
published: true
title: Apache Mod Rewrite Escaped Slashes Problem + Solution
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4220
wordpress_url: http://www.edmondscommerce.co.uk/?p=4220
date: 2013-04-11 11:05:20.000000000 +01:00
categories:
- apache
tags:
- bug
- apache
- search
- error
- solution
- mod_rewrite
- rewrite
- url
- crawl
---
As part of our Magento SEO service, the first thing we do is to make sure there are no issues with the crawlability and general health of the clients web site. 

Whilst working on the Google Webmaster Tools crawl errors for a client I noticed one specific and intruiging problem for which I couldn't immediately see the reason, everything looked to be set up perfectly.

Certain URLs were getting 404 responses. The URL was being parsed by mod_rewrite but everything looked fine so why was apache giving a 404?

The problem turns out to be that the URLs contain escaped slashes (eg search/KTA-mb667k2%2F2g),

The problem is that Apache actually handles the escaped slash and helpfully converts it to a real slash. That then means that it is trying to look in a sub folder that does not exist and hence the 404.

Chances are you don't want escaped slashes to really be thought of as real directory separating slashes, especially if you are using mod_rewrite.

The answer is a simple one liner to be added to your vhost.conf or httpd.conf.

```

AllowEncodedSlashes On

```
