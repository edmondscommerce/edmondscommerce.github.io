---
layout: post
status: publish
published: true
title: Check if MySQL Table Exists
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 106
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/check-if-mysql-table-exists/
date: 2009-01-27 16:23:29.000000000 +00:00
categories:
- php
tags:
- mysql
- php
- table
- exists
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Sometime you need a PHP script to check for the existence of a MySQL table. This function achieves that for you.

```php

function db_table_exists($table){
	$exists = false;
	$tables_query = db_query("SHOW TABLES FROM " . MYSQL_DB);
	while($t = mysql_fetch_assoc($tables_query)){
		foreach($t as $k=>$v){
			if($v == $table){
				$exists = true;
				break;
			}
		}
	}
	return $exists;
}

```
