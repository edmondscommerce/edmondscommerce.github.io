---
layout: post
status: publish
published: true
title: Netbeans Define Variable Type in Comment
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1595
wordpress_url: http://www.edmondscommerce.co.uk/?p=1595
date: 2010-04-08 12:30:56.000000000 +01:00
categories:
- netbeans
tags:
- php
- netbeans
- autocomplete
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you use Netbeans for PHP like me (its awesome) and you ever use any kind of function or method to return objects, then you will have noticed that Netbeans' autocompletion doesn't work for these variables.

However, you can make Netbeans work how you expect, by using some special comments.

Check out these two blog stories:

<a href="http://blogs.sun.com/netbeansphp/entry/defining_variable_type_in_a">http://blogs.sun.com/netbeansphp/entry/defining_variable_type_in_a</a>

<a href="http://blogs.sun.com/netbeansphp/entry/defining_a_variable_type_in">http://blogs.sun.com/netbeansphp/entry/defining_a_variable_type_in</a>

In a nutshell, you can define a variable as being a specific object by using a comment in this format:

```php

$o=getObject('ObjectName');
/* @var  $o ObjectName  */
$o->/*autocomplete kicks in here */

```

That's a really nice feature I think :)

Oh yeah, they are adding Zend Framework support as well !

<a href="http://blogs.sun.com/netbeansphp/entry/zend_framework_support_added">http://blogs.sun.com/netbeansphp/entry/zend_framework_support_added</a>

If I ever see these guys, I'm definitely buying them a beer!
