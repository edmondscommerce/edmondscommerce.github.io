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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
