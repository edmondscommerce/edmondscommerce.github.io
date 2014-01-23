---
layout: post
status: publish
published: true
title: PHP Basics, some thing that is false and true at the same time!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2937
wordpress_url: http://www.edmondscommerce.co.uk/?p=2937
date: 2012-02-14 15:16:55.000000000 +00:00
categories:
- php
tags:
- php
- test
- basics
- tricky
---
What can be true and false at the same time?
```php

$a = "a";
$b = 0;

if($a == true && $b == false && $a == $b) {
	echo "Passed";
}

```

This is because PHP tries to convert "a" to a numeric, as there is no numeric value it gets changed to zero. So 0 == 0 is true. At the same time the string "a" converted to boolean evaluates to true. 0 evaluates to false. While there isn't an actual value that is both true and false that the same type, depending on the context a value may evaluate to true or false depending on what it is been compared to. To avoid problems like this, you should use triple equals (===) unless you know other wise.
