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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
