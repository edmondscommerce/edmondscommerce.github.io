---
layout: post
status: publish
published: true
title: PHP DomPDF Bug - page_cache.cls.php on line 66 dompdf + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2476
wordpress_url: http://www.edmondscommerce.co.uk/?p=2476
date: 2011-06-24 15:29:39.000000000 +01:00
categories:
- php
tags:
- php
- fatal
- error
- solution
- class
- pdf
- cache
- page
- dompdf
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are struggling with a weird bug with DomPDF, something about it trying to connect to a postgres database..

well here is the solution that will get you up and running:

open the file and make the init method just return false

```php

class Page_Cache {
    const DB_USER = "dompdf_page_cache";
    const DB_PASS = "some meaningful password";
    const DB_NAME = "dompdf_page_cache";

    static private $__connection = null;

    function init() {
        return false;
        if (is_null(self::$__connection)) {
            $con_str = "host=" . DB_HOST .
                    " dbname=" . self::DB_NAME .
                    " user=" . self::DB_USER .
                    " password=" . self::DB_PASS;

            if (!self::$__connection = pg_connect($con_str))
                throw new Exception("Database connection failed.");
        }
    }

```

Not sure really why this is trying to do this, obviously some kind of hard coded postgres caching system but anyway this fixed it.
