---
layout: post
status: publish
published: true
title: PHP Detect if Script is running from CLI
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1591
wordpress_url: http://www.edmondscommerce.co.uk/?p=1591
date: 2010-04-01 13:55:30.000000000 +01:00
categories:
- php
tags:
- php
- CLI
- Detect
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you have a script that you want to behave differently depending on whether it is called from the command line or via a http request then this little snippet of code is what you need.

```php

    if(!defined('STDIN')){ //its not via command line
        // do non command line stuff
    }

```
