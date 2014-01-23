---
layout: post
status: publish
published: true
title: Console Log not working in Magento + solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2774
wordpress_url: http://www.edmondscommerce.co.uk/?p=2774
date: 2011-12-16 13:10:11.000000000 +00:00
categories:
- magento
tags:
- javascript
- magento
- magento problem
- solution
- console
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are writing any javascript in magento and try to debug using console.log, you may find that nothing happens in Chrome, but everything works as expected in Firefox.

The reason for this is that varien have included a blank console object to prevent any calls to the console throwing an error if a console isn't defined. However they explicitly check for firebug, which means if your running chrome the built in console is replaced.

To fix this you need to edit the js/varien/js.js file and find the following line
<code>
 if (!("console" in window) || !("firebug" in console))
</code>

Replace the line with the following
<code>
 if (!("console" in window) || typeof console !== 'object')
</code>

and you can start console logging in chrome
