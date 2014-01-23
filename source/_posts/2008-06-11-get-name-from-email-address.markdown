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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Check out this simple and easy function for extracting the name from an email address. It's not very advanced but it is quite handy. Of course it could be used for similar applications by simply changing the character to split on.

```php

function email_name($email_address, $split='@'){
	return ucwords(strtolower(substr($email_address, 0, strripos($email_address, $split))));
}

```

There are some very powerful things you can do with PHP and email. Check out this <a rel="nofollow" href="http://www.phpclasses.org/browse/package/2.html">POP3 email class</a> for some ideas. I am just starting to scratch the surface of this functionality and will doubtless have some more great things to show soon.

