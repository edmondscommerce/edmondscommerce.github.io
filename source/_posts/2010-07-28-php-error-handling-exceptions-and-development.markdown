---
layout: post
status: publish
published: true
title: PHP Error Handling, Exceptions and Development
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1751
wordpress_url: http://www.edmondscommerce.co.uk/?p=1751
date: 2010-07-28 15:47:59.000000000 +01:00
categories:
- php
tags:
- php
- bug hunting
- error handler
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Often when creating new code, you want the system to die on any kind of error so that you can be sure that there are no bugs lurking in minor errors that are actually having a major effect.

An easy way to do this is to do this:

create a file called error_handler.php with the following contents:

```php

<?php
/* File error_handler
 * Edmonds Commerce
 * www.edmondscommerce.co.uk
 * info@edmondscommerce.co.uk
 * 0844 357 0201
 */

function ec_error_handler($severity, $message, $filename, $lineno) {
  /*if (error_reporting() == 0) {
    return;
  }
  if (error_reporting() & $severity) {*/
    throw new ErrorException($message, 0, $severity, $filename, $lineno);
  /*}*/
}
set_error_handler('ec_error_handler');

function ec_exceptions_handler(Exception $e){
    h(1, 'Uncaught Exception');
    h(2, $e->getMessage());
    h(3, 'Line ' . $e->getLine() . ' of ' . $e->getFile());
    foreach($e->getTrace() as $t){
        var_dump($t);
    }
    die;
}

set_exception_handler('ec_exceptions_handler');

```

(Note the h function is this:)

```php

function h($n, $t){
echo "<h$n>$t</h$n>";
}

```

Now include that file somewhere and all of your tiniest errors will throw an exception and dump a stack trace for you. 

This is great for bug hunting.

You will notice that there is some commented out code in the ec_error_handler. Uncomment this if you want the error reporting level to be that of your php.ini settings.

As it is it will throw exceptions for everything, but for bug hunting that's good I think
