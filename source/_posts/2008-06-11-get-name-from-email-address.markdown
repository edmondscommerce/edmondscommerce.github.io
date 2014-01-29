---
layout: post
status: publish
published: true
title: Get Name from Email Address
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 55
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/get-name-from-email-address/
date: 2008-06-11 12:08:42.000000000 +01:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Check out this simple and easy function for extracting the name from an email address. It's not very advanced but it is quite handy. Of course it could be used for similar applications by simply changing the character to split on.

```php

function email_name($email_address, $split='@'){
	return ucwords(strtolower(substr($email_address, 0, strripos($email_address, $split))));
}

```

There are some very powerful things you can do with PHP and email. Check out this <a rel="nofollow" href="http://www.phpclasses.org/browse/package/2.html">POP3 email class</a> for some ideas. I am just starting to scratch the surface of this functionality and will doubtless have some more great things to show soon.

