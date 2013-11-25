---
layout: post
status: publish
published: true
title: PHP List Function Silently Failing? Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3062
wordpress_url: http://www.edmondscommerce.co.uk/?p=3062
date: 2012-03-28 12:01:50.000000000 +01:00
categories:
- php
tags:
- php
- bug
- key
- array
- solution
- list
- string
- values
- associate
- numeric
- indexed
---
If you use PHP's <a href="http://php.net/manual/en/function.list.php">list</a> function to quickly extract array values out into dollar variables then you might have an issue where it just doesn't work for some reason.

The problem is that list only works with numeric arrays. If you are using an associative array (with strings for keys instead of numbers) then list will not work.

There is any easy solution though, simply change:

```php

$array = array('a'=>1, 'b'=>2, 'c'=>3);
list($a, $b, $c) = $array;

```

To:

```php

$array = array('a'=>1, 'b'=>2, 'c'=>3);
list($a, $b, $c) = array_values($array);

```

And it will work as you expect.
