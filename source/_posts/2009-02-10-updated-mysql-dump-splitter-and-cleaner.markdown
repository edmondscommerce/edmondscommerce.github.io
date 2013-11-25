---
layout: post
status: publish
published: true
title: Updated MySQL Dump Splitter and Cleaner
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 135
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=135
date: 2009-02-10 13:58:27.000000000 +00:00
categories:
- mysql
- php
tags:
- mysql dump split
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
My MySQL dump splitting script has come in handy countless times. Recently I also needed to remove keys from an SQL dump to enable me to import a dump that had keys associated with text columns.

Here is the updated script

*note - now updated again to strip out any drop table statements if splitting

```php

<?php
/*MySQL Dump Split to Tables
* script supplied by Edmonds Commerce
* www.edmondscommerce.co.uk
* if you like it, please link back with a do-follow
* 
* Now updated with better regex and also the ability to strip out keys other than the primary
*/
echo '<h1>MySQL Dump Split to Tables + Remove Keys</h1>';
set_time_limit(600);
if(!isset($_GET['dump_file'])){
	echo '<form><b>Dump File Path:</b> <input name="dump_file"> <input type="submit" value="go"><select name="operation"><option value="split">split by tables</option><option value="keys">remove keys other than primary</option><option value="both">both</option></select></form>';
}else{
	if(preg_match('%keys|both%', $_GET['operation'])){
		$contents = file_get_contents($_GET['dump_file']);
		$pattern = '%,(s+?)KEY(.*?))%si';
		$nokeys = preg_replace($pattern, '', $contents);		
		$_GET['dump_file'] = 'nokeys.sql';
		file_put_contents('nokeys.sql', $nokeys);
	}
	if(preg_match('%split|both%',$_GET['operation'])){
		echo '<h3>Splitting File</h3>';
		flush();
		$handle = fopen($_GET['dump_file'], "r") or die('failed openeing source file ' . $_GET['dump_file']);
		if ($handle) {
			while (!feof($handle)) {
				$line = fgets($handle);	
				if(preg_match('%^drop table(.+?);%i', $line)){
					continue;
				}					
				if(stristr($line, 'CREATE TABLE')){
					echo '. ';
					if(isset($out)){
						fclose($out);
						unset($out);
					}
					preg_match('%CREATE TABLE (`|)(w+)(`|)(s+)($%i', $line, $matches);
					$table_name = $matches[2];
					$out = fopen('output/'.$table_name . '.sql', 'w') or die('failed to create file ' . $table_name . '.sql');
					fwrite($out, $line . "n") or die('failed writing to file ' . $table_name . '.sql');
				}else{
					if(isset($out)){
						fwrite($out, $line . "n");
					}
				}		
			}
			fclose($out);
			fclose($handle);
		}else{
			echo 'no handle on file - does it exist - permissions...';
		}
	}
}
echo '<h1>Done</h1>'
?>


```<h4>More...</h4><a href="http://www.edmondscommerce.co.uk/blog/mysql/updated-mysql-dump-splitter-and-cleaner/" rel="nofollow">Updated <b>MySQL Dump</b> Splitter and Cleaner | Edmonds Commerce Blog</a><br><a href="http://www.branedy.net/?p=790" rel="nofollow">Branedy » Blog Archive » Wordpress <b>MySQL</b> exercises</a><br><a href="http://blog.drawcode.com/2009/02/10/python-script-to-backup-mysql-databases-wordpress-or-other-databases/" rel="nofollow">Python Script to Backup MySql Databases (Wordpress or other databases)</a><br><a href="http://www.philaahzophy.com/2008/12/24/importing-large-mysql-databases-with-bigdump/" rel="nofollow">Importing Large MySQL Databases With BigDump</a><br><a href="http://garagetechblog.com/2009/03/03/mysql-upgrade-1and1-is-not-the-best-host-in-the-world/" rel="nofollow"><b>MySQL</b> Upgrade: 1and1 is not the best host in the world | TheGarage <b>...</b></a><br>
