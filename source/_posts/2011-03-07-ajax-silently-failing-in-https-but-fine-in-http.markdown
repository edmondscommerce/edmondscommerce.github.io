---
layout: post
status: publish
published: true
title: Ajax Silently Failing in HTTPS but fine in HTTP
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2168
wordpress_url: http://www.edmondscommerce.co.uk/?p=2168
date: 2011-03-07 16:41:21.000000000 +00:00
categories:
- javascript
tags:
- javascript
- post
- get
- ssl
- jquery
- https
- fail
- silently
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are struggling to debug why some ajax, perhaps using jquery etc is working fine when you access the page via http, but if you use https then it fails silently with very little error messaging to work on then this could be your solution.

Basically, although you have accessed the page over HTTPS, if there are any insecure elements on the page then your ajax call will default to http and will then fail silently thanks to cross domain policy problems.

If you debug in chrome, you do get a meaningful error message but if like me you generally prefer working in Firefox and Firebug then you are up the creek.

Double check your source code for http:// and also check out live http headers for insecure calls.
