---
layout: post
status: publish
published: true
title: PHP Generated SQL
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 50
wordpress_url: http://www.edmondscommerce.co.uk/blog/mysql/php-generated-sql/
date: 2008-05-21 12:14:15.000000000 +01:00
categories:
- mysql
- php
tags:
- for
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you find yourself laboriously building SQL queries by typing each field = 'value' statement... think again.

Imagine this:

```php

$sql_query = mysql_query("select * from table");

$insert_elsewhere_sql = "INSERT INTO other_table SET ";

while($s = mysql_fetch_assoc($sql_query)){
	foreach($s as $k=>$v){
	$insert_elsewhere_sql .= "$k = '$v', ";
}

$insert_elsewhere_sql = substr($insert_elsewhere_sql, 0, -2);


```

This will generate a valid SQL insert statement with all of your field, value pairs set up.

Time saver or what?
