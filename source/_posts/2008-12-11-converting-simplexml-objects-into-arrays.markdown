---
layout: post
status: publish
published: true
title: Converting SimpleXML Objects into Arrays
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 85
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/converting-simplexml-objects-into-arrays/
date: 2008-12-11 14:29:42.000000000 +00:00
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
PHP's simple XML is sometimes counter intuitive. Whilst it is acknowledged to be more simple than its predecessors, the "simple" name might be pushing things a bit.

One thing that keeps cropping up when working with SimpleXML is the way that it lets you work with its objects as if they were arrays. That sometimes makes you feel like you are working with an array - and therefore makes things confusing when they display particularly non array like behaviour.

Sometimes the simplest thing to do here is to turn the object into a real array.

Check out this function:

```php

function sx_array($obj){
	$arr = (array)$obj;
	if(empty($arr)){
		$arr = "";
	} else {
		foreach($arr as $key=>$value){
			if(!is_scalar($value)){
				$arr[$key] = sx_array($value);
			}
		}
	}
	return $arr;
}

```

For example if you are working with an xml element that may or may not contain attributes, converting to an array first will allow you to figure this out.

For example

```php

$file_index_xml = new SimpleXMLElement($local_full_index, NULL, TRUE);
foreach($file_index_xml->xpath("/interface/files.index/file") as $file){
	$arr = sx_array($file->attributes());
	if($arr['@attributes']['Value']){
		//do something
	}
}

```
