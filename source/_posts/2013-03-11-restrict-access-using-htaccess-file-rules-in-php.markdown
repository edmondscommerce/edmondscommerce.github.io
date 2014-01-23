---
layout: post
status: publish
published: true
title: Restrict Access Using .htaccess File Rules in PHP
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4127
wordpress_url: http://www.edmondscommerce.co.uk/?p=4127
date: 2013-03-11 15:29:34.000000000 +00:00
categories:
- php
tags:
- php
- function
- htaccess
- access
- control
- list
- tip
- variable
- static
- authorisation
- ip address
- deny
- allow
- procedural
---
The function below is one that we have used a few times to allow certain "admin only" assets to be accessed or visible on the front end of a website.

The theory is that the htaccess file in the admin folder will be kept up to date and can therefore be used as the authoritative list of IP addresses that are allowed to access admin assets.

This function is simple enough and should be useful anywhere that you use htaccess to protect a certain folder and would like to implement the same white list rules in other places without having to maintain a duplicate list of authorised IP addresses.

The function also uses <a href="http://www.php.net/manual/en/language.variables.scope.php#language.variables.scope.static" title="PHP.net Static Variables" target="_blank">static variables</a> - a lesser known bit of PHP functionality which can be a nice easy performance optimisation when working with procedural PHP code. If a function will be called many times and will always return the same result in a single request, you can actually cache that result to a static variable and serve that on any subsequent requests.

```php

function isAllowedIp() {
    static $pass = null;
    if ($pass !== null) {
        return $pass;
    }
    $pass=false;
    $customer_ip = $_SERVER['REMOTE_ADDR'];    
    $htaccess = file_get_contents('admin/.htaccess');
    preg_match_all('%allow from ([0-9.]+)%', $htaccess, $matches);
    foreach ($matches[1] as $ip) {
        if ($ip == $customer_ip) {
            $pass = true; //this is stored statically for perfomance reasons
            return true;
        }
    }
    return false;
}

```
