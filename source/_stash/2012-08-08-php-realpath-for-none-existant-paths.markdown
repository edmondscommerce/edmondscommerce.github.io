---
layout: post
status: publish
published: true
title: PHP Realpath for None Existant Paths
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3224
wordpress_url: http://www.edmondscommerce.co.uk/?p=3224
date: 2012-08-08 13:43:30.000000000 +01:00
categories:
- php
tags:
- php
- function
- path
- tip
- relative
- absolute
- realpath
- format
- normalise
---
If you want the functionality of realpath, to take a path containing relative elements such as /../ then this little function is exactly what you are looking for.

PHP's built in realpath function will return false if the file or folder does not exist. Unfortunately when using complex paths then this can make debugging things a little complicated.

To resolve this simply use this function:

```php

function normalizePath($path) {
    return array_reduce(explode('/', $path), create_function('$a, $b', '
			if($a === 0)
				$a = &quot;/&quot;;

			if($b === &quot;&quot; || $b === &quot;.&quot;)
				return $a;

			if($b === &quot;..&quot;)
				return dirname($a);

			return preg_replace(&quot;/\/+/&quot;, &quot;/&quot;, &quot;$a/$b&quot;);
		'), 0);
}

```

For example:

```php

$path = dirname(__FILE__) . '/../../../folder/';
$path = normalizePath($path);
echo $path; // /var/www/vhosts/domain.com/folder

```
