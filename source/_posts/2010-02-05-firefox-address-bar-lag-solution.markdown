---
layout: post
status: publish
published: true
title: Firefox Address Bar Lag + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1361
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1361
date: 2010-02-05 10:38:41.000000000 +00:00
categories:
- firefox
tags:
- firefox
- address bar
- slow
- lag
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If your firefox address bar is getting a bit slow and laggy as it tries to find suggestions, I found one single about:config tweak totally sorted it out for me.

browser.urlbar.search.timeout = 100

change to 

browser.urlbar.search.timeout = 10

To do this, open a new tab and type about:config

Then agree to the thing that says you know what you are doing and in the filter bar at the top type:

urlbar.search.timeout

you can then double click on the value (set to 100 by default) and change it to whatever you want. I tried 10 and that seems to work great for me, but you might want to experiment.
