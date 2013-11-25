---
layout: post
status: publish
published: true
title: Unable to do string comparisions on Magento Urls [Solution]
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2862
wordpress_url: http://www.edmondscommerce.co.uk/?p=2862
date: 2012-01-17 19:43:24.000000000 +00:00
categories:
- magento
tags:
- links
- php
- problem
- magento
- solution
- var_dump
---
I have been making a mwnu system for magento that would allow a client to add extra links to CMS page to top menu through a static block. One of the requirements was when you clicked the link the menu should display as active.

To do this I extended the Category_Navigation Block so it would get the content of the static block and then check each href against the current url. If they matched then it would add the active class to the menu structure. This worked perfectly when running locally, so I pushed it to our staging site where it broke.

Assuming that there was a difference with the url structure on the stagin site that I hadn't anticipated, I echoed out the link variables and compared them, but they looked identical. Thinking there may be spacing that had snuck past trim, I var_dumped them and again they looked identical, apart for the fact that the character count was different.

After much messing around I came to two conclusions. Firstly Magento will append a session id to urls if you're using multi-store, and far more importantly, this extra information is not displayed if you var_dump the variable. I finally found this by turning the string into an array and echoing each character onto a new line, like so
```php

$link = $this->getUrl();
// outputs http://www.example.com/index.php
var_dump($link);
$array = preg_split('//', $link, -1);
foreach($array as $char) {
// simplified replace with print($char."\n") to get each character on a new line
print($char);
}
// outputs http://www.example.com/index.php?___SID=U

```

To solve this replace your link with the following
```php

$link = preg_replace('%\?.*%', '', $this->getLink());

```

and it will work the way that you expect.
