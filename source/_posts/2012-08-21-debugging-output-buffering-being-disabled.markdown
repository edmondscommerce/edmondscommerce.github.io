---
layout: post
status: publish
published: true
title: Debugging Output Buffering Being Disabled
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3308
wordpress_url: http://www.edmondscommerce.co.uk/?p=3308
date: 2012-08-21 17:09:55.000000000 +01:00
categories:
- php
tags:
- php
- debug
- tip
- ob_start
- ob_get_clean
- output
- buffering
---
If you are confused as to exactly which bit of code is killing your output buffer in PHP then you might love this little trick. Combined with Xdebug it can get you to the root of the problem quickly and easily.

The trick involves using the callback function capability of ob_start.

Firstly you need to make a callback handler, for example:

```php

function ob_callback(){
    echo 'wtf';
}

```

Then in your IDE, set a break point on the echo line. If you aren't using Xdebug, you could do something like this instead:


```php

function ob_callback(){
    echo '<h1>Output Buffer Has Been Killed</h1><pre>';
    var_dump(debug_backtrace());
    die;
}

```


Then where you are starting your output buffer, simply pass in the function name as a parameter like so:

```php

ob_start('ob_callback');

```
