---
layout: post
status: publish
published: true
title: Check 301 redirects in htaccess file
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2778
wordpress_url: http://www.edmondscommerce.co.uk/?p=2778
date: 2011-12-16 18:04:23.000000000 +00:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Often you will come across a situation where you have to do a mass of redirects, often when moving platform e.g. from osCommerce to Magento.

So you might create a whole load of .htaccess rules which you want to verify, either before or after implementing them.

Rules like : 
<code>RewriteRule ^top-level-category/old-category/product-name-p-3944.html$ new-product-name.html</code>

I wrote this bash snippet to do just that - here's the validate the pages you are redirecting to are valid (200) :-

<code>
for f in `cut -f3 -d' ' .proposed-htaccess`; do 
    curl -I -v http://www.mydomain.co.uk/$f 2>&1 > /dev/null | grep 'HTTP/1.1 ' | sed s/'.*1\.1 '// | grep 200 > /dev/null || echo $f failed to fetch
done
</code>

Then, once you have got the .htaccess uploaded you can verify that they are indeed rewriting should you wish :-


<code>
for f in `cut -f3 -d' ' .proposed-htaccess`; do 
    curl -I -v http://www.mydomain.co.uk/$f 2>&1 > /dev/null | grep 'HTTP/1.1 ' | sed s/'.*1\.1 '// | grep 301 > /dev/null || echo $f was not a 301.
done
</code>
