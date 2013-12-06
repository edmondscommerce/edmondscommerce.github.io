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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
