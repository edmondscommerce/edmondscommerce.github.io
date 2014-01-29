---
layout: post
status: publish
published: true
title: PHP Cached Download Function
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 67
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-cached-download-function/
date: 2008-08-04 14:52:51.000000000 +01:00
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
If you are coding a PHP script to deal with big files, it makes sense to build in some kind of caching logic so that your script won't download the same file every single time it is run, but will check to see how long ago it last downloaded that file and only download it again if it is more than a certain timeframe old.

This function allows you to do exactly that - check it out:

```php


$cache_days = 1;

$cache_days = $cache_days * (24*60*60);

function cached_download($remote, $local){
$cache_days = $GLOBALS['cache_days'];
if(file_exists($local) && (filemtime($local) > (time() - $cache_days))){
// we have a local copy that is less than $cache_days old
echo '
<h3>Using Cached - Last Downloaded ' . date('H:m:s d/m/Y', filemtime($local) . '</h3>
';
}else{
echo '
<h3>Downloading Now...</h3>
';
flush();
copy($remote, $local);
}
}


```
