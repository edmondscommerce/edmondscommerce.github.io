---
layout: post
status: publish
published: true
title: MySQL Dump Partial Restore - Split MySQL Dump into Tables
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 38
wordpress_url: http://www.edmondscommerce.co.uk/blog/mysql/mysql-dump-partial-restore-split-mysql-dump-into-tables/
date: 2008-04-09 18:39:55.000000000 +01:00
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
MySQL dumps are often used as a quick and easy way of backing up an entire MySQL database in one go. However, they are only really designed to restore whole databases as well. So what if you only want to restore certain tables?

I have written this nice little PHP script which will take your dump file and split it into lots of little sql files - one for each table. You can then restore which ever tables you want.

Simply create a php file in the same directory as your dump file. Name it something easy to remember. Then go to it in your web browser, input the name of the dump file and click go.

As this is a fairly massive task (depending on the size of your dump file) you may find it works better on your local test server with some generous php_ini settings for max_execution_time etc.

```php

<?php
/*MySQL Dump Split to Tables
* script supplied by Edmonds Commerce
* www.edmondscommerce.co.uk
* if you like it, please link back with a do-follow
*/
echo '<h1>MySQL Dump Split to Tables</h1>';
set_time_limit(600);
if(!isset($_GET['dump_file'])){
	echo '<form><b>Dump File Path:</b> <input name="dump_file"> <input type="submit" value="go"></form>';
}else{
	$handle = @fopen($_GET['dump_file'], "r");
	if ($handle) {
		while (!feof($handle)) {
			$line = fgets($handle);
			if(strstr($line, 'CREATE TABLE')){
				if(isset($out)){
					fclose($out);
					unset($out);
				}
				preg_match('%CREATE TABLE `(.+?)`%', $line, $matches);
				$table_name = $matches[1];
				$out = fopen($table_name . '.sql', 'w');
				fwrite($out, $line . "\n");
			}else{
				if(isset($out)){
					fwrite($out, $line . "\n");
				}
			}	
		}
		fclose($out);
		fclose($handle);
	}	
}
echo '<h1>Done</h1>'
?>


```
