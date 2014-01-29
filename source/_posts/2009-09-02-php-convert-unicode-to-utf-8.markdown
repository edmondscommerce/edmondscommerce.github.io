---
layout: post
status: publish
published: true
title: PHP Convert UNICODE to UTF-8
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1177
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1177
date: 2009-09-02 10:46:26.000000000 +01:00
categories:
- php
tags:
- php
- unicode
- iconv
- text file
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are struggling with a UNICODE file in your PHP scripts and aren't ready or able to make the jump to PHP5.3 then this little snippet might help you out:

```php

$converted = dirname(__FILE__).'/converted.txt';
$source= dirname(__FILE__).'/source.txt';
shell_exec("iconv -o $conv  -f UNICODE -t UTF-8 -V $converted");

```

Its using the Linux iconv command. Of course it requires you to be running on Linux.
