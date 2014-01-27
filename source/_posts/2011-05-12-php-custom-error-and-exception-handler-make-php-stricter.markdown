---
layout: post
status: publish
published: true
title: PHP Custom Error and Exception Handler - Make PHP Stricter
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2250
wordpress_url: http://www.edmondscommerce.co.uk/?p=2250
date: 2011-05-12 11:20:58.000000000 +01:00
categories:
- php
tags:
- development
- php
- exception
- custom
- debug
- error
- handler
- strict
- notice
- warning
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you prefer a coding style that doesn't let you get away with as much as PHP does by default then you may like this trick. 

As standard PHP will let you get away with quite a lot of things that are probably not a good idea. Some times that can be great, allowing you to quickly prototype things or achieve results quickly without having to go through nit picking your code.

However on the other hand if you are working on a production system that you would really rather complained as much as possible in the dev stage to help to minimise the likelihood that bugs will creep through to production then this looseness can work against you.

For this reason I often use this trick to make PHP much more fussy and strict and make errors much more obvious and easier to deal with.

First of all, we need to create a custom error handler. This will override the standard error handling in PHP and allow us to do what we want. What I am going to do is convert all of the standard PHP errors into exceptions.

<b>Error Handler</b>
```php

function ec_error_handler($severity, $message, $filename, $lineno) {
    if (error_reporting() == 0) {
        return;
    }
    //if (error_reporting() & $severity) {
    throw new ErrorException($message, 0, $severity, $filename, $lineno);
    //}
}

```

You will notice that 2 lines are commented out. If uncommented, this will respect the error reporting settings of PHP. Commented out it throws an exception regardless of PHP error reporting settings.

To make PHP use this function as my error handler we do the following:

```php

set_error_handler('ec_error_handler');

```

So now every PHP error, notice etc is being converted into an exception. This gives me the ability to view stack traces and see exactly which file, line etc is involved so tracking issues down is a snap.

Now though I want a nice system to capture these exceptions and dump this info to the screen.

<b>Exception Handler</b>
```php

function ec_exceptions_handler(Exception $e) {
    ob_start();
    h(1, 'Uncaught Exception');
    h(2, $e->getMessage());
    h(3, 'Line ' . $e->getLine() . ' of ' . $e->getFile());
    foreach ($e->getTrace() as $t) {
        var_dump($t);
    }
    dumpObjects();
    $exceptionMessage = ob_get_clean();
    echo $exceptionMessage;
    exit(1);
}

```

This function starts the output buffer then dumps a large amount of information including the message, line and file for the exception. The full stack trace.

It's also dumping all global objects using another function.

This output is captured into a variable with ob_get_clean(). At this point, you might decide to log this variable to a file, database, ticketing system etc - I leave that bit to you. Finally the info is dumped to the screen and the program exits.

Of course this is not something you should do in a production environment, this level of information on a production system is a welcome invitation to hackers to exploit you. However in a secure local dev environment its exactly what you need.

To get PHP to use this exception handler, we do the following:

```php

set_exception_handler('ec_exceptions_handler');

```

Here are the other functions you will need:

<b>Dump Objects</b>
This one simply var dumps all the objects as they are at the time of the exception. This may be overkill for your situation, I leave that up to you.
```php

function dumpObjects() {
    h(1, 'Dumping Objects');
    foreach ($GLOBALS as $g) {
        if (is_object($g)) {
            h(2, get_class($g));
            var_dump($g);
        }
    }
}

```

<b>H Tag Helper</b>
And this is just a html helper to create H tags
```php

function h($n, $m){
    echo "<h$n>$m</h$n>";
    flush();
}

```

I hope you find this useful. Feel free to add any comments etc below.


