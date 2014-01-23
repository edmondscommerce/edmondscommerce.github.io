---
layout: post
status: publish
published: true
title: 'Tip: Copy CSS Selector in chrome'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3064
wordpress_url: http://www.edmondscommerce.co.uk/?p=3064
date: 2012-03-29 16:14:21.000000000 +01:00
categories:
- chrome
tags:
- javascript
- html
- Cascading Style Sheets
- chrome
- jquery
- tip
- css
---
Okay, this is hacky but it really works, and saves a lot of time!

To copy the css selector of an element in chrome, you need your developer tools open popped-out of chrome, not docked but here is the trick :-

Inspect the element that you want, be sure it's selected in developer tools, then press F12.  This will open a second developer tools window inspecting the first developer tools.

Then, insert the following two lines of javascript magic, one at a time - the first pulls jQuery into the developer tools and the second runs a function to build the css path and output it into the console!

First jQuery :
```
var script = document.createElement('script');script.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.3/jquery.min.js";document.getElementsByTagName('head')[0].appendChild(script);
```
Then the path :
```
path=""; function addtopath(str) { if(typeof(str) != 'undefined') {path = str+' '+path} } jQuery('.crumbs span').each(function(){addtopath(jQuery(this).attr('title'))}); path;
```

You can try stringing them together into one command, but sometimes jQuery doesn't seem to load fast enough.
