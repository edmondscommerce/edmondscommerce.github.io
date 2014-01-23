---
layout: post
status: publish
published: true
title: Got the Insecure Content on a Secure HTTPs Page Problem - Easy Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2841
wordpress_url: http://www.edmondscommerce.co.uk/?p=2841
date: 2012-01-12 12:28:54.000000000 +00:00
categories:
- security
tags:
- javascript
- html
- web
- design
- problem
- ssl
- solution
- image
- page
- https
- insecure
- mixed
---
Often you will see SSL warnings or errors related to insecure content being displayed on a secure page.

This could be as simple as one javascript file or image that is being included via http rather than https, though some times this can be a bit tricky to track down.

The easiest solution is to hit this site:

<a href="http://www.whynopadlock.com/">http://www.whynopadlock.com/</a>

This will give you a clear report of the problems and should help you quickly find and fix them.

Alternatively if you use Chrome you may see the details in the Javascript console.

Once you know what elements are being called by http as opposed to https, you simply need to make them use https or remove them altogether.
