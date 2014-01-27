---
layout: post
status: publish
published: true
title: Accessing Raw XML Posted to a Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1289
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1289
date: 2009-12-21 15:20:56.000000000 +00:00
categories:
- php
tags:
- post
- server
- xml
- raw
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you have a script that is receiving posted XML for whatever reason and are trying to access this XML without any filtering, escaping etc then this is the solution you are looking for.

Instead of trying to access via $_POST etc, you can simply call the following:

```php

$xml = file_get_contents('php://input');

```

This will then allow you to load it into Simple XML for example for further processing

```php

$sx = simplexml_load_string($xml);
if($sx){
   ....
}

```
