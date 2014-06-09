---
layout: post
status: publish
published: true
title: Curl 404 but Fine in Browser + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 391
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=391
date: 2009-05-19 13:55:09.000000000 +01:00
categories:
- scraping
tags:
- curl
- gzip
- '404'
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I just hit an intriguing situation where a page that was perfectly viewable in my browser was not visible via curl. 

I scratched my head and messed around testing the page in variety of online proxy services and local web browsers. I even stared messing about with telnet and manually typing headers. My conclusion was that the simpler systems such as text based browsers were not able to see the page and were instead given a 404 message.

However better more modern browsers could see the page. Likewise the page was visible in the Google cache and aso Google Translate.

In the end I downloaded a neat little firefox add-on called Tamper Data. This allows you to tweak your request headers before they are submitted. 5 minutes later I realised that it was the Gzip compatibility which was causing the issue.

Curl (being the awesome tool that it is) can handle Gzip compression, but I wasn't using it. I have now added the following line to my curl function and I am pulling pages fine.

```php

 if(!empty($compression)){
    curl_setopt($go,CURLOPT_ENCODING , $compression);
 }

``` 
