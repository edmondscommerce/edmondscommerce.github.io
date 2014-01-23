---
layout: post
status: publish
published: true
title: Javascript Debugging
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 78
wordpress_url: http://www.edmondscommerce.co.uk/blog/javascript/javascript-debugging/
date: 2008-11-18 11:55:19.000000000 +00:00
categories:
- javascript
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
When creating Javascript, it can be useful to alert out the values of various strings or arrays. You can also use this to confirm if certain parts of loops or if statements are being reached. However - having loads of alert statements in your Javascript can be messy and time consuming to manage.

For this reason I use this Javascript debug function. I use a PHP variable $debug to control whether or not this Javascript debug function outputs anything or not. If enabled, it will create an alert with info on the variable, array or whatever that has been passed to it.

If the $debug PHP variable is not set to true, the dbug function simply returns as soon as it is called - does nothing basically.

Here is the Javascript function

```javascript

// for debugging only
function dbug(arr,level) {
	<?php 
	if(!$debug){
		echo 'return;';
	}
	?>
	var dumped_text = "";
	if(!level) level = 0;

	//The padding given at the beginning of the line.
	var level_padding = "";
	for(var j=0;j<level+1;j++) level_padding += "    ";
	if(typeof(arr) == 'object') { //Array/Hashes/Objects
		for(var item in arr) {
			var value = arr[item];
			if(typeof(value) == 'object') { //If it is an array,
				dumped_text += level_padding + "'" + item + "' ...\n";
				dumped_text += dump(value,level+1);
			} else {
				dumped_text += level_padding + "'" + item + "' => \"" + value + "\"\n";
			}
		}
	} else { //Stings/Chars/Numbers etc.
		dumped_text = "===>"+arr+"<===("+typeof(arr)+")";
	}
	alert(dumped_text);
}	

```

To use the function, first of all (assuming you are using PHP) you need to declare the $debug variable at the top of your script and set it to true:

```php

<?php
$debug = true;

```

Then in your Javascript simply use dbug(var) whenever you want something outputted.

For example:

```javascript

//Calling the function...
function init() {
var arra = new Array("Hloo",'s',23,23.1,"Hello World");
var assoc = {
 "val"  : "New",
 "number" : 14,
 "theting" : arra
};

dbug(assoc);
}

```

This was adapted from the Dump function available <a href="http://binnyva.blogspot.com/2005/10/dump-function-javascript-equivalent-of.html" target="_blank" rel="nofollow">here</a>
