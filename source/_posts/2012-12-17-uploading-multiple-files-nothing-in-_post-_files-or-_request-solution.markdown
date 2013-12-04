---
layout: post
status: publish
published: true
title: Uploading Multiple Files - Nothing in _POST, _FILES or _REQUEST +Solution
author: martyn
author_login: martyn
author_email: info+martyn@edmondscommerce.co.uk
wordpress_id: 3803
wordpress_url: http://www.edmondscommerce.co.uk/?p=3803
date: 2012-12-17 15:27:14.000000000 +00:00
categories:
- php
tags:
- web
- development
- php
- problem
- developer
- solution
- fix
- tip
---
When you're uploading multiple files (HTML5 feature - remember IE as yet STILL does not support this), it may not be the fact you're uploading multiple files that's actually causing the problem.

The problem often is actually caused by the various php memory limits in play, one way to avoid getting caught by this is using the following snippet in the form's php to remind you which restrictions are in play (note the min_by_key() function is from the php.net comments) :-

```php

<?php
function min_by_key($arr, $key){
    $min = array();
    foreach ($arr as $val) {
        if (!isset($val[$key]) and is_array($val)) {
            $min2 = min_by_key($val, $key);
            $min[$min2] = 1;
        } elseif (!isset($val[$key]) and !is_array($val)) {
            return false;
        } elseif (isset($val[$key])) {
            $min[$val[$key]] = 1;
        }
    }
    return min( array_keys($min) );
}

$arrayMaxes = array(
    'upload_max_filesize'=>intval(ini_get('upload_max_filesize')),
    'post_max_size'=>intval(ini_get('post_max_size')),
    'memory_limit'=>intval(ini_get('memory_limit'))
);
$maxUploadSize = min($arrayMaxes);
foreach ($arrayMaxes as $key=>$value) {
    if ($value == min($arrayMaxes)) {
        $minimumOfThree = $key;
    }
}?>
<p>Max filesize <?php echo $maxUploadSize; ?>M Maximum filesize due to server setting <?php echo $minimumOfThree; ?> in php.ini</p>

```
