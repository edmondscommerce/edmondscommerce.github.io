---
layout: post
status: publish
published: true
title: PHP Save Images Using cURL
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 33
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-save-images-using-curl/
date: 2008-03-18 14:53:47.000000000 +00:00
categories:
- php
- curl
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Some hosts disabled the ini setting allow_url_fopen. This also means that the ability to easily grab images by calling imagecreatefromjpeg($img) where $img is a url for an external image does not work.

This is a shame as this technique is pretty easy..

```php

$remote_img = 'http://www.somwhere.com/images/image.jpg';
$img = imagecreatefromjpeg($remote_img);
$path = 'images/';
imagejpeg($img, $path);

```

However I was tearing my hair out trying to get a product feed integration system to work on a host that has disabled the allow_url_fopen mechanism which meant the above wouldnt work.

Thankfully cURL was still working. So here is the function I made for grabbing and saving an image using cURL instead:

```php

//Alternative Image Saving Using cURL seeing as allow_url_fopen is disabled - bummer
function save_image($img,$fullpath){
	$ch = curl_init ($img);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_BINARYTRANSFER,1);
	$rawdata=curl_exec($ch);
	curl_close ($ch);
	if(file_exists($fullpath)){
		unlink($fullpath);
	}
	$fp = fopen($fullpath,'x');
	fwrite($fp, $rawdata);
	fclose($fp); 
}

```

Another Problem Solved :-)
