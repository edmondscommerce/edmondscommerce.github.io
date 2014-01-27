---
layout: post
status: publish
published: true
title: PHP MySQL Query Function with Easy Error Message
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 25
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-mysql-query-function-with-easy-error-message/
date: 2008-03-03 11:30:43.000000000 +00:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
This is a simple mysql query function that gives you a nice understandable error message if something goes wrong. You probably would not want this kind of error reporting on a live site, but for testing and developing its pretty handy.

What the function does it perform the database query as normal, but if the query fails, the function gives you a full breakdown of the mysql error messsage allowing you to easily see what has gone wrong and fix it.

```php

function db_query($query){

$output = mysql_query($query) or die('
<h1 style="color: red">Uh Oh......MySQL Error:</h1>
<h3>Query:</h3>
<pre>' . htmlentities($query) . '</pre>
<h3>MySQL Error:</h3>
' . mysql_error() . '
<hr /> <hr />');	return $output;

}

```

You would not want to use this query on a live site that is public facing as the error messages will help someone who is trying to break into your system. If you wanted to be able to use this function on a live site and quickly turn the error reporting on and off, we could use a definition like this:

```php

define(MYSQL_ERROR_REPORTING: false;);

```

Then change the function to be like this:

```php

function db_query($query){
if(MYSQL_ERROR_REPORTING){
$output = mysql_query($query) or die('
<h1 style="color: red">Uh Oh......MySQL Error:</h1>
<h3>Query:</h3>
<pre>' . htmlentities($query) . '</pre>
<h3>MySQL Error:</h3>
' . mysql_error() . '
<hr /> <hr />');
}else{
$output = mysql_query($query);
}
return $output;
}

```Then if you need to see the mysql errors, you can quickly edit the definition to allow mysql error reporting by changing the definition to true.

We would always recommend developing and debugging web sites on the localhost and only making changes to the live site once you are sure that everything works. However sometimes for whatever reason it is hard to replicate an error on the localhost so you really need to see what's happening on the live site.

Alternatively if you are developing an internal system that will only be accessed by your own staff, then some built in error reporting helps you to fix problems that may occur, and also helps your more savvy staff to understand what has gone wrong and give you a good idea so that you can fix it.
