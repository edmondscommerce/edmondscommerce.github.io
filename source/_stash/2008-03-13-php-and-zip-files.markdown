---
layout: post
status: publish
published: true
title: PHP and Zip Files
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 30
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-and-zip-files/
date: 2008-03-13 16:41:07.000000000 +00:00
categories:
- php
- zip
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
There aren't many things you can't do with PHP. One of the things you can do is deal with zip files.

PHP has a built in class for dealing with zip files which allows you to create them, unpack them, add and delete things from them and generally use them within your scripts.

Recently on a spidering / product feed integration job that I have been working on I needed to grab a load of image zip files and unpack them all into a folder called 'images/' (surprisingly enough)

Here is how I did it:

```php

function unpack_zips($directory, $destination = 'images/'){
	$files = dir_list($directory);
	//print_r($files);
	$zips = array();
	foreach($files as $k=>$file){
		if(stristr($file, '.zip')){
			$zips[] = $directory . $file;
		}
	}
	print_r($zips);
	$zip = new ZipArchive;
	foreach($zips as $z){
		if ($zip->open($z) === TRUE) {
			$zip->extractTo($directory . $destination);
			$zip->close();
			//echo "<h3>$z OK</h3>";
		} else {
			echo"<h3 style=\"color: red;\">$z Failed</h3>";
			bottom();
		}	
	}
}

function dir_list($directory){
	echo $directory;
	if ($handle = opendir($directory)) {
		while (false !== ($file = readdir($handle))) {
			if($file != '.' && $file != '..'){
				$return[] = $file;
			}
		}
		closedir($handle);
		return $return;
	}else{		
		return false;
	}
}

```

There are two functions. The first function is the one that deals with the Zip files. The second function is called by the first function and simply lists all files within a specified directory.

These two functions combined allowed me to find all zip files in a particular folder and then unpack them all into a destination folder.

<b>Related Resources</b>

<a href="http://www.phpclasses.org/browse/package/945.html" rel="nofollow">http://www.phpclasses.org/browse/package/945.html</a>

<a rel="nofollow" href="http://www.phpit.net/article/creating-zip-tar-archives-dynamically-php/">http://www.phpit.net/article/creating-zip-tar-archives-dynamically-php/</a>
