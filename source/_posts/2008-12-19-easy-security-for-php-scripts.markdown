---
layout: post
status: publish
published: true
title: Easy Security for PHP Scripts
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 89
wordpress_url: http://www.edmondscommerce.co.uk/blog/security/easy-security-for-php-scripts/
date: 2008-12-19 15:09:45.000000000 +00:00
categories:
- php
- security
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you have a script, admin area or whatever that you would like to make a bit more secure, you can use the following chunk of code to do this. If you don't have SSL (HTTPS) set up then you would need to get this sorted first.

This isn't bullet proof protection, but it helps.

```php


//IP addresses that you would like to be able to access the system
$allowed_ips[] = '99.99.99.01';
$allowed_ips[] = '99.99.99.02';
$allowed_ips[] = '99.99.99.03';
if(!in_array($_SERVER['REMOTE_ADDR'], $allowed_ips)){
	header('HTTP/1.1 500 Internal Server Error');
	exit();
}

//Force SSL Usage
if($_SERVER['SERVER_PORT'] != 443){ //assuming your server is running SSL on port 443
	$url = "https://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
   	header('Location: '.$url);
}


```
