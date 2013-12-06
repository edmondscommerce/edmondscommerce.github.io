---
layout: post
status: publish
published: true
title: Form File Upload Limits with PHP
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3855
wordpress_url: http://www.edmondscommerce.co.uk/?p=3855
date: 2013-01-11 16:49:24.000000000 +00:00
categories:
- php
tags:
- html
- php
- problem
- form
- size
- upload
- file
- limit
- ini
- settings
- min
---
If you have a form designed to handle file uploads which is failing due to file size then you might like this:

```php

$arrayMaxes = array(
    'upload_max_filesize' => intval(ini_get('upload_max_filesize')),
    'post_max_size' => intval(ini_get('post_max_size')),
    'memory_limit' => intval(ini_get('memory_limit'))
);
$maxUploadSize = min($arrayMaxes);
foreach ($arrayMaxes as $key => $value) {
    if ($value == min($arrayMaxes)) {
        $minimumOfThree = $key;
        break;
    }
}

echo "The maximum file size you can upload is $maxUploadSize, this is due to the php.ini setting $mininimumOfThree";

```

This will calculate the smallest value that will be allowed based upon php.ini settings.

You can then incorporate this into your form logic and display so that users have a clear understanding of how large a file they can upload.
