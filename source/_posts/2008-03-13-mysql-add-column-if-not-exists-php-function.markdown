---
layout: post
status: publish
published: true
title: MySQL Add Column if Not Exists - PHP Function
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 31
wordpress_url: http://www.edmondscommerce.co.uk/blog/mysql/mysql-add-column-if-not-exists-php-function/
date: 2008-03-13 17:23:16.000000000 +00:00
categories:
- mysql
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
This is a nice little function which I struggled to find elsewhere on the web. 

As discussed elsewhere this is not the kind of thing that should be included in a public facing script, but for administration tools etc its pretty handy:

```php

function add_column_if_not_exist($db, $column, $column_attr = "VARCHAR( 255 ) NULL" ){
	$exists = false;
	$columns = mysql_query("show columns from $db");
	while($c = mysql_fetch_assoc($columns)){
		if($c['Field'] == $column){
			$exists = true;
			break;
		}
	}		
	if(!$exists){
		mysql_query("ALTER TABLE `$db` ADD `$column`  $column_attr");
	}
}

```

This function grabs the column information for the table, then it loops through the info looking for the column. If it finds the column then it acknowledges that it exists and ceases the loop.

After this stage, the function checks to see if exists is true or not, and if it is not true then it adds the column with the attributes defined when calling the function. 

The default attributes are for a VARCHAR field up to 255 characters in length and NULL enabled.
