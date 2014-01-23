---
layout: post
status: publish
published: true
title: 'Building Spiders: Grab Data, Post Forms and Interact with Web Sites Automatically'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 12
wordpress_url: http://www.edmondscommerce.co.uk/blog/firefox/building-spiders-grab-data-post-forms-and-interact-with-web-sites-automatically/
date: 2008-02-14 11:56:16.000000000 +00:00
categories:
- php
- curl
- spidering
- firefox
- programming
tags:
- mysql
- firefox
- php
- screen scraping
- spider
- spidering
- curl
- post
- get
- http
- headers
- addon
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
One of the most useful and powerful things you can do with PHP is to create a programme which will simulate a web browser and can grab data, post data to forms and generally interact with other web sites - automatically.

For PHP to be able to work like this it must have the CURL library installed and active. It is the CURL library which actually handles all of the interaction and PHP is my scripting language of choice for interacting with CURL.

A simple CURL function is like this:

```php


function curl($url){

$timeout = '300'; //how long before CURL gives up on this page
$go = curl_init();
curl_setopt ($go, CURLOPT_URL, $url);
curl_setopt ($go, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($go, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt ($go, CURLOPT_TIMEOUT, $timeout);
$page = curl_exec($go);
curl_close($go);
return $page;

}


```

This function when called and echoed will output the entire html of the $url specified.

For grabbing data from this page to be inserted into a database (for example when spidering a suppliers web site for product information to be inserted into your site) we then use regular expressions to find what we are looking for and then insert that into the database.

so for example if we wanted to grab the product title and we knew that this was wrapped in a h1 tag with the class "product title" we could use this regexp to grab this:

```php


$page = curl($url);

$pattern = '%
<h1 class="product_title">(.+?)</h1>
%i';

preg_match($pattern,$page,$matches);

print_r($matches); //we can see the entire array of matches and choose which we want to insert into the database


```

We can also Post data to web sites using curl. This allows us to do all kinds of things including grabbing data that is displayed on the submission of post forms. Here is an example Curl Post Function:
```php


function curl_post($url,$post_data){

$timeout = '300'; //how long before CURL gives up on this page
$go = curl_init();
curl_setopt ($go, CURLOPT_URL, $url);
curl_setopt ($go, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($go, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt ($go, CURLOPT_TIMEOUT, $timeout);
//now for the post section
curl_setopt($go, CURLOPT_POST, true);

curl_setopt($go, CURLOPT_POSTFIELDS, $post_data);
$page = curl_exec($go);
curl_close($go);
return $page;
}

```

It can be tricky to figure out exactly what data should be in the post string. To help you out though is this incredibly handy addon for firefox: <a href="https://addons.mozilla.org/en-US/firefox/addon/3829" target="_blank">Live Http Headers</a>.

This addon lets you see exactly what is going on between your browser and the web site you are visiting. This can quickly and easily give you the information you need to replicate the same behaviour with your CURL script.

Edmonds Commerce specialise in working with PHP and CURL. If you have any spidering, screen scraping or other application that requires PHP to actively interact with other web sites - <a href="http://www.edmondscommerce.co.uk/contact-about-curl-and-php.html">get in touch today</a> to see how we can help you benefit from this incredibly powerful technique.

Related Resources

<a href="http://www.phpfour.com/blog/2008/01/20/php-http-class/" rel="nofollow">http://www.phpfour.com/blog/2008/01/20/php-http-class/</a>

<a href="http://www.phpclasses.org/browse/package/1988.html" rel="nofollow">http://www.phpclasses.org/browse/package/1988.html</a>

<a href="http://www.phpit.net/article/using-curl-php/" rel="nofollow">http://www.phpit.net/article/using-curl-php/</a>

<a href="http://skeymedia.com/intro-to-curl-with-php/" rel="nofollow">http://skeymedia.com/intro-to-curl-with-php/</a>
