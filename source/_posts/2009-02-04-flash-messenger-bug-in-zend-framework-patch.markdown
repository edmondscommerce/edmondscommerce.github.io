---
layout: post
status: publish
published: true
title: Flash Messenger Bug in Zend Framework + Patch
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 116
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=116
date: 2009-02-04 16:06:39.000000000 +00:00
categories:
- php
tags:
- php
- zend framework
- flashmessenger
- bug
- '5.2'
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Arrgh am I going mad.. could something so simple really not work..?

It turns out that I wasn't going mad, and Flash Messenger in Zend Framework really does have a bug. If its not working for you, the following patch may well fix things. You can check if this bug applies by setting your error reporting to E_ALL in your bootstrap.

If you get the following error message then this patch should fix things for you.

```

Notice: Indirect modification of overloaded property Zend_Session_Namespace.....

```

To fix this problem and get FlashMessenger working correctly, you need to edit library/Zend/Controller/Action/Helper/FlashMessenger.php

find this line
```php

self::$_session->{$this->_namespace}[] = $message;

```

and replace with this block
```php

 //self::$_session->{$this->_namespace}[] = $message;
$sessionMessages = self::$_session->{$this->_namespace};
$sessionMessages[] = $message;
self::$_session->{$this->_namespace} = $sessionMessages;

```

Apparently this issue only affects php 5.2 and so they have decided not to fix it and instead suggest upgrading the PHP version. If you need to get it working though the above will fix it for you.

<a href="http://framework.zend.com/issues/browse/ZF-1385;jsessionid=EF0F1B3DF6D09DC98918BBCCD06F0262?page=com.atlassian.jira.plugin.system.issuetabpanels:all-tabpanel" rel="nofollow">more info</a>

If you want a nice tutorial about flash messenger, check out <a href="http://shabadeehoob.com/2008/08/24/setting-up-flash-messages-in-zend-framework/" rel="nofollow">this page</a>
