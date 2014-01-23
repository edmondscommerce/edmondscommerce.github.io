---
layout: post
status: publish
published: true
title: Debugging PHP Scripts
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 32
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/debugging-php-scripts/
date: 2008-03-17 14:16:26.000000000 +00:00
categories:
- php
- debugging
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
When coding PHP, or more frequently when trying to customise or fix someone elses code, it can sometimes be tricky to figure out exactly what is going wrong.

In this kind of situation, it is often neccessary to go through the flow of the script and view the contents of the various strings and arrays at that stage of the script.

I have written this small function to help in this process:

```php

function dbug($item){
	echo '<hr><h3>Debug Info</h3><pre>' . (var_export($item, true)) . '</pre><hr>';	
}

```

This script will take any item and print out detailed information for you in a nicely formatted and easy to read way.

For an example when you might decide to use this functionality, you could check the contents of your $_POST

```php

<?php
/*very top of script */
dbug($_POST);

```
