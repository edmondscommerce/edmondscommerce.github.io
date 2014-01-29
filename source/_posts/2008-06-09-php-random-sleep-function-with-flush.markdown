---
layout: post
status: publish
published: true
title: PHP Random Sleep Function with Flush
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 53
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-random-sleep-function-with-flush/
date: 2008-06-09 12:50:25.000000000 +01:00
categories:
- php
- scraping
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Sometimes you want your script to pause for a short period of time before repeating a loop or proceeding to the next step. This may be to reduce server load or even to simulate the natural pauses that a person would make whilst browsing a site. This kind of thing is especially true if you are building a system to scrape content such as product information from a suppliers web site and you do not want to hammer their server to death and get your IP banned.

```php

 function sleep_flush($chunks=10){

 	$c=0;

 	while($c < $chunks){

 		$rand = rand(2000000, 6000000);

 		echo '<br> . . . sleeping for ' . round(($rand / 1000000),2) . ' seconds . . . zzzzzzzzzzzzzz<br>';

 		flush();

 		usleep($rand);

 		$c++;

 	}

}

``` 	

This function will do just that for you. Also it has a built in flush which will help in preventing the script from being regarded as timed out if you are running it from the web browser.
