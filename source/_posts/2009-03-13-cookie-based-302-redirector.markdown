---
layout: post
status: publish
published: true
title: Cookie Based 302 Redirector
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 237
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=237
date: 2009-03-13 11:46:27.000000000 +00:00
categories:
- php
tags:
- php cookie
- 302 redirect
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you have a site that is installed on your live server but for the moment you do not want to go live, this little code snippet will allow you to redirect any visitors who don't have a secret GET variable in the URL to a holding subdomain with a 302 redirect.

A 302 redirect is a temporary redirect. Search engine spiders will see this as a temporary thing and will not remove the original URL from their index.

Just put this at the top of any page you want to protect. For a Magento or any other MVC php site, just putting this on the top of the index.php file will protect the whole system.

Note this isn't real security, its just something to keep the spiders out. Please don't regard it as secure.

```php

if(isset($_GET['letmein'])){
	setcookie('letmeinmydomain.com');
}

if(!isset($_COOKIE['letmeinmydomain.com']) && !isset($_GET['letmein'])){
	header('HTTP/1.1 302 Found');
	header('Location: http://coming-soon.mydomain.com');
	exit;
}

``` 
