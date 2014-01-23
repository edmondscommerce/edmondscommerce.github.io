---
layout: post
status: publish
published: true
title: Crawl an xml sitemap quality check 301 and 404
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2782
wordpress_url: http://www.edmondscommerce.co.uk/?p=2782
date: 2012-01-03 17:54:30.000000000 +00:00
categories:
- php
tags:
- seo
- development
- php
- xml
- ecommerce
- solution
- sitemap
---
On occasion, google and other tools will tell you there's errors with your sitemap.xml file and not give you the information of what exactly is wrong, so we wrote this little tool to crawl the sitemap and check for 301 redirections and 404 errors.

It is a noddy file and should have much more error handling etc but here's the basic flow :-

```php

<?php
$screenwidth = 80;
function trimstr($str, $maxlength = -1, $middle = '...') {
	global $screenwidth;
	if ($maxlength == -1) {
		$maxlength = $screenwidth - 1;
	}
	if (count($str) > $maxlength) {
		$partlength = round($maxlength - count($middle) / 2);
		$leftpart = substr($str, 0, $partlength);
		$rightpart = substr($str, 0-$partlength);
		return $leftpart . $middle . $rightpart;
	} else {
		return $str;
	}
}

// First we load the sitemap xml
$xml = simplexml_load_file($argv[1]);
$counter = 0;
$threadcount = 5;
$multihandle = curl_multi_init();
$fourohfours = $threeohones = $twohundreds = 0;
if ($xml->getName() != 'urlset') {
	die("Doesn't look like a valid sitemap!");
}
$total_urls = count($xml->children());

// Then we iterate over it
foreach($xml->children() as $child)
{
	if ($child->getName() == 'url') {
		foreach ($child->children() as $subchild) {
			if ($subchild->getName() == 'loc') {
				echo "Fetching : ".trimstr($subchild, $screenwidth - 12)."\n";
				$counter++;
				addurltostack($subchild);
				if ($counter%$threadcount == 0 || $counter == $total_urls) {
					do {
						curl_multi_exec($multihandle, $running);
					} while ($running > 0);
					processresults();
					echo "\n".$counter.'/'.$total_urls.' urls checked - '.$twohundreds.' 200s; '.$threeohones.' 301s; '.$fourohfours.' 404s.'."\n";
				}
			}
		}
	}
}
echo "\n";
if ($fourohfours > 0) {
	echo "The following urls were 404 returns :- \n";
	foreach ($fourohfoururls as $url) {
		echo $url."\n";
	}
}
if ($threeohones > 0) {
	echo "The following urls were 301 returns :- \n";
	foreach ($threeohoneurls as $url) {
		echo $url."\n";
	}
}
function addurltostack($url) {
	global $curls;
	global $multihandle;
	$ch = curl_init();
	$curls[] = $ch;
	// Set the url path we want to call
	curl_setopt($ch, CURLOPT_URL, $url);
	// Make it so the data coming back is put into a string
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
	curl_setopt($ch, CURLOPT_HEADER, TRUE); 
	curl_setopt($ch, CURLOPT_NOBODY, TRUE); // remove body 
	curl_multi_add_handle($multihandle, $ch);
}

function processresults() {
	global $curls;
	global $multihandle;
	global $fourohfours;
	global $fourohfoururls;
	global $threeohones;
	global $threeohoneurls;
	global $twohundreds;
	global $multihandle;
	foreach ($curls as $ch) {
		$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); 
		$url = curl_getinfo($ch, CURLINFO_EFFECTIVE_URL); 
		// Free up the resources $ch is using
		curl_multi_remove_handle($multihandle,$ch);
		curl_close($ch);
		switch($httpCode) {
			case 400 : 
				$fourohfours++;
				$fourohfoururls[] = $url;
			break;
			case 301 : 
				$threeohones++;
				$threeohoneurls[] = $url;
			break;
			case 200 : $twohundreds++;
			break;
		}
	}
	curl_multi_close($multihandle);
	$multihandle = curl_multi_init();
	$curls = array();
}
?>

```

The above takes about 3/4 hour for an approximately 3000 link sitemap.  This script utilises curl_multi so it runs 5 requests at a time to the server.
