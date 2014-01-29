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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
