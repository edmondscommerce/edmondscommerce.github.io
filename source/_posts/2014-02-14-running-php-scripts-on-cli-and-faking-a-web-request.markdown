---
layout: post
title: "Running PHP Scripts on CLI and Faking a Web Request"
date: 2014-02-14 17:31:14 +0000
comments: true
author: joseph
categories: 
 - php
tags: 
 - php
 - web
 - cli
 - get
 - post
description: "A simple method to run a PHP script designed to handle a web request on the command line"
---

Some times you build a PHP script that is designed to run from a web request and you want to run it on the command line. 
The problem is that you have used the standard PHP super globals and you would rather not refactor the script loads.

Here is a nice quick solution:

``` php
if(isset($argc)){
    for ($i = 1; $i < $argc; $i++) {
    	$things = explode("=", $argv[$i]);
        if (false !== stripos($things[0], 'POST:')) {
             $post = str_replace('POST:', '', $things[0]);
             $_POST[$post] = $things[1];
        } else {
             $_GET[$things[0]] = $things[1];
        }
    }
}

echo "\nGET:\n";
var_dump($_GET);
echo "\nPOST:\n";
var_dump($_POST);

```
This will loop over the argc variable that is defined when running in CLI mode and will fake the `$_GET` and `$_POST` variables as required.

To run this with get and post variables you would do this:

```
php -f script.php getvar1=test getvar2=foo POST:postvar1=bar
```

And that's it. It is not particularly pretty but it can be pretty handy.
