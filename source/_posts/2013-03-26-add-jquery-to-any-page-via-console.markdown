---
layout: post
status: publish
published: true
title: Add Jquery to Any Page via Console
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4197
wordpress_url: http://www.edmondscommerce.co.uk/?p=4197
date: 2013-03-26 18:44:22.000000000 +00:00
categories:
- jquery
tags:
- google
- chrome
- jquery
- api
- console
- add
---
Sometimes you might want to do a little on the fly DOM editing using your favourite Javascript library - jQuery.

To do this you might need to include jQuery on the page, you can do this by pasting these lines into your console in Chrome or Firebug in Firefox.

 
<pre class="lang:js decode:true " title="Run this in your console" >var jq = document.createElement('script');
jq.src = "http://code.jquery.com/jquery-latest.min.js";
document.getElementsByTagName('head')[0].appendChild(jq);
jQuery.noConflict();
</pre> 

And there you have it, the full power of jQuery at your fingertips

