---
layout: post
status: publish
published: true
title: Advanced PHP Debug Function
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 34
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/advanced-php-debug-function/
date: 2008-03-20 14:33:52.000000000 +00:00
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
I have taken the debug function about as far as I can think of. This function will now take a variable and display it all in a nice easy to read format. It will also give the name of the variable being examined. It works with html, using htmlentites. It preserves the tab layout formatting for arrays making it easy to understand:

<b>Heres How to Use It:</b>
```php

//For example, displaying $_POST information
dbug($_POST);

//If using inside a function
function something($blah){
dbug($blah, get_defined_vars());
}

```
Note that if called within the scope of a function (for example) you must give get_defined_vars().

<b>And here are the neccessary functions</b>
```php

//DEbug Functions

//convert tabs to spaces
function tab2space($text){
	$text = str_replace('  ', '&nbsp;&nbsp;', $text);
	$text = str_replace("\t", '&nbsp;&nbsp;&nbsp;&nbsp;', $text);
	return $text;
}

//return name of variable passed by reference
function vname(&$var, $scope=false){
    if($scope) $vals = $scope;
    else      $vals = $GLOBALS;
    $old = $var;
	$new = 'THISONE';
	$var = $new;
	$vname = false;
    foreach($vals as $key => $val) {
		if($val !=='var'){
			if($val === $new) $vname = $key;
		}
    }
    $var = $old;
    return $vname;
  }


function dbug(&$item, $scope=false){
	$vname = vname(&$item,$scope);
	echo '<hr><h3>Debug Info: $' . $vname  . '</h3>' . tab2space(nl2br(htmlentities(var_export($item, true)))) . '<hr>';	
}

```
