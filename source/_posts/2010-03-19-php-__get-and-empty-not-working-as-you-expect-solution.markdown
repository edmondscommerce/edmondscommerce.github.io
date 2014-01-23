---
layout: post
status: publish
published: true
title: PHP, __get() and empty() Not Working As You Expect? - Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1573
wordpress_url: http://www.edmondscommerce.co.uk/?p=1573
date: 2010-03-19 10:57:32.000000000 +00:00
categories:
- php
tags:
- php
- object
- empty
- property
- magic
- method
- __get
- __isset
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are tearing your hair out trying to figure out why empty($object->property) = true when var_dump($object->property) outputs a value - this might be the problem.

It arises if you are using the magic __get() method to serve up object properties.

Apparently PHP's empty() function actually uses isset() to determine if the property is empty or not. To get this to work properly, you also need to declare a magic __isset() method.

This is how I got around this problem:

```php

public function __get($key){
	if(/* some condition to return your key */){
		return $this->$key;
	}
	return null;
}

public function __isset($key){
	if(null===$this->__get($key)){
		return false;
	}
	return true;
}

```

thanks to Janci's comment <a href="http://www.php.net/manual/en/function.empty.php#93117">here</a>, I'm not sure how long that would have taken me to figure out on my own, but for sure you saved me a LOT of time. I hope this blog post helps out someone else who hits this same issue.
