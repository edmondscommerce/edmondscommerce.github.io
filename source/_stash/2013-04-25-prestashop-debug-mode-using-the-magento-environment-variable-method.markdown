---
layout: post
status: publish
published: true
title: Prestashop Debug Mode using the Magento Environment Variable Method
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4236
wordpress_url: http://www.edmondscommerce.co.uk/?p=4236
date: 2013-04-25 10:14:30.000000000 +01:00
categories:
- prestashop
tags:
- magento
- server
- developer
- debug
- error
- prestashop
- variable
- site
- live
- mode
- environment
- handling
- display
---
Magento developers are no doubt familiar with the concept of defining a server environment variable MAGE_IS_DEVELOPER_MODE so that when running Magento locally it is always in developer mode but there is no chance of accidently deploying a live site in developer mode.

This little trick will allow you to use the same environment variable to also have the same effect when working with PrestaShop.

To explain - developer mode generally means that things like error messages and debugging information are displayed clearly in the browser which makes things much easier when you are developing, to see what is going wrong.

On a live site you want to keep error information hidden and generally display to the customer a more friendly error message screen that perhaps helps them find their way back to a functional section of the site or gives them information to contact the site owner directly for assistance.

Anyway, to put PrestaShop in debug mode locally but have no risk of deployign this to live you can alter the file: config/defines.inc.php

from 
```php

define('_PS_MODE_DEV_', false);

```

to
```php

define('_PS_MODE_DEV_', isset($_SERVER['MAGE_IS_DEVELOPER_MODE']));

```


