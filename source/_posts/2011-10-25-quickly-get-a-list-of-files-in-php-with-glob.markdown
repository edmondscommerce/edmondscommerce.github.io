---
layout: post
status: publish
published: true
title: Quickly Get a List of Files in PHP with glob()
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2696
wordpress_url: http://www.edmondscommerce.co.uk/?p=2696
date: 2011-10-25 11:24:37.000000000 +01:00
categories:
- php
tags:
- php
- files
- tip
- directory
- glob
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Perhaps not as well known as it should be, PHP's glob() function is really quite powerful and exceptionally handy.

Need to get a list of files in a directory - try this:

```php

$tools = glob('includes/tools/*');
var_dump($tools);

```

Want to delete all files matching a specific pattern, try this:

```php

array_map('unlink', glob('export_feeds/my_feed_*'));

```

Theres lots more tricks you can do.

One word of warning though - with great power comes great responsibility!

I would advise against using any kind of user input with this function.

<a href="http://php.net/manual/en/function.glob.php">Read more</a>
