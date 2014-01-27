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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
