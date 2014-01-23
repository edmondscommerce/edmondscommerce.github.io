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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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

```<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.ip-seo.com/latest/index.php/2009/02/254/" rel="nofollow">SEO News » What is a 301 re-direct?</a><br><a href="http://blogs.isaserver.org/shinder/2009/03/06/how-to-allow-http-301-through-isa-server-2006/" rel="nofollow">Thomas Shinder Blog » Blog Archive » How to Allow HTTP 301 through <b>...</b></a><br><a href="http://www.dizitalblog.com/2009/03/12/the-power-of-php/" rel="nofollow">The Power of <b>PHP</b> | DizitalBlog</a><br><a href="http://www.crivionweb.com/phpblog/php-tutorial-cookies-and-sessions/" rel="nofollow">» <b>PHP</b> Tutorial : <b>Cookies</b> and sessions</a><br></div>
