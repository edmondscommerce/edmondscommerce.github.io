---
layout: post
status: publish
published: true
title: MySQL Desc Table
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 138
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=138
date: 2009-02-11 15:22:34.000000000 +00:00
categories:
- mysql
- web development
- php
- ecommerce
tags:
- mysql
- table
- desc
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are feeling lazy, or would like to build in some future proofness into your system, you can use the MySQL Desc query to get table column information and then use this information to create dynamic SQL insertion strings.

For example:

```php

$cols_query = db_query("desc table");
while($cq = mysql_fetch_assoc($cols_query)){
	$cols[]=$cq;
}
foreach($cols as $c){
	if(!empty($_POST[$c['Field']])){
		$sets[] = $c['Field'] . " = '" . mysql_real_escape_string($_POST[$c['Field']]) . "'";
	}
}
mysql_query("insert into table set " . implode(', ', $sets));

```
