---
layout: post
status: publish
published: true
title: PHP 301 Redirect Function with Headers Check and Javascript Fallback
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 52
wordpress_url: http://www.edmondscommerce.co.uk/blog/search-engine-optimisation/php-301-redirect-function-with-headers-check-and-javascript-fallback/
date: 2008-05-22 15:46:48.000000000 +01:00
categories:
- search engine optimisation
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
If you are changing your URL structure, for example when moving to a search engine friendly URLs system, you need to be able to let Google and all the other search engines that the page has moved to the new URL. You really don't want to display the same content on two URLs

So to achieve this we can do what is called a 301 redirect. This is a special redirect message which basically says "has permanently moved to". By doing this, all of the search engine power, rank or whatever you want to call it will be directly transferred to the new URL.

<strong>However</strong>

Sometimes your script might spit out the headers earlier than you expect. If this happens then your site will fail completely to load with a fatal error along the lines of 

<strong>warning: Cannot modify header information - headers already sent by (output started at .</strong>...

We really don't want this to happen, so what we can do is wrap the redirection in a headers_sent check and then fall back to a javascript redirect if headers have been sent for some reason. This is belt and braces logic.

<i><b>Note script tags need spaces removing</b></i>
```php

function requrl_check($correct_url, $delay=3){
	$request_url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
	if($request_url != $correct_url){
		if(!headers_sent()){ //going to assume that headers are not sent
		header("HTTP/1.1 301 Moved Permanently");
 			header('location: ' . $correct_url . ''); 
 			exit();
 		}else{
 			echo "<h3>The Page $request_url has Moved</h3>
 			<a href=$correct_url>$correct_url</a>";
 			echo '<h3>Now Refreshing in ' . $delay . ' Seconds</h3>Refreshing to:<br>' . $correct_url . '<s c r i p t type="text/JavaScript"><!--
	    setTimeout("location.href = \'' . $correct_url . '\';",' . ($delay * 1000) . ');
	    --> </s c r i p t>';
	    	exit();
		}
	}
}

```


tidy :-)

<b>Further Reading:</b>
<a rel="nofollow" href="http://www.stuntdubl.com/2005/09/06/301-redirects/">www.stuntdubl.com</a>
<a rel="nofollow" href="http://www.intertwingly.net/blog/911.html">www.intertwingly.ne</a>
<a rel="nofollow" href="http://webgasm.actiononline.biz/seo/?p=87">webgasm.actiononline.biz</a>
<a rel="nofollow" href="http://www.techcounter.com/seo/permalink-migration-for-a-wordpress-blog-using-a-301-redirect/">www.techcounter.com</a>
<a rel="nofollow" href="http://www.chiropractichomepage.com/2007/03/16/chiropractor-web-page-gets-301-redirect/">www.chiropractichomepage.com</a>
<a rel="nofollow" href="http://123howtoguide.com/seo/how-to-redirect-a-web-page-using-301-redirect">123howtoguide.com</a>
<a rel="nofollow" href="http://searchblog.tamar.com/2007/07/understanding-t.html">searchblog.tamar.com</a>
