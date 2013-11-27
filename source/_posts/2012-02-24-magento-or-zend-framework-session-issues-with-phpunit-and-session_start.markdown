---
layout: post
status: publish
published: true
title: Magento or Zend Framework Session issues with PHPUnit and session_start()
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2984
wordpress_url: http://www.edmondscommerce.co.uk/?p=2984
date: 2012-02-24 16:07:57.000000000 +00:00
categories:
- php
tags:
- php
- headers
- problem
- magento
- zend
- solution
- zf
- framework
- phpunit
- unit
- session
- sent
---
If you are having issues running unit tests that work with sessions and call session_start(), you might see error messages like this:

<strong>output started at "PHPUnit/Util/Printer.php:173"</strong>

If you do, the solution is fairly simple. Just add the flag --stderr to PHPUnit eg

```

 phpunit --stderr mytest.php

```

If you are using Netbeans, you simply need to add this to your PHPUnit script setting in 

Tools->Options->PHP->Unit Test

eg /opt/lampp/bin/phpunit --stderr

{% img  /assets/Screenshot-600x323.png %}
