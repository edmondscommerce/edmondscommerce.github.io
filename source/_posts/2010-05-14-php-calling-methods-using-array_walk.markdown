---
layout: post
status: publish
published: true
title: PHP Calling Methods using Array_Walk
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1650
wordpress_url: http://www.edmondscommerce.co.uk/?p=1650
date: 2010-05-14 10:59:08.000000000 +01:00
categories:
- php
tags:
- php
- array_walk
- methods
- objects
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
The array_walk function is one of those unassuming little PHP functions that a lot of people may well ignore, but it is often very useful and can save writing out lines of code, compressing a pretty common coding structure into a single function call. Of course that also means that it is fast!

However, the standard documentation doesn't make it clear if you can use array_walk on an array and use a class method as the callback rather than a global function. You can and here is how to do it:

```php

$object = new MyClass;
$array = array(/* some array */);
array_walk($array, array($object, 'methodName'));

```
