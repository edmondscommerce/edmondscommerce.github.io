---
layout: post
status: publish
published: true
title: Magento Custom Options Multiple File Upload Problem + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1240
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1240
date: 2009-11-03 15:34:22.000000000 +00:00
categories:
- magento
tags:
- magento
- custom
- option
- images
---
If your Magento custom options with multiple file uploads isn't working properly, its because of a bug in the core Magento code.

You can either edit the core file 
Open magento\app\code\core\Mage\Catalog\Model\Product\Option\Type\File.php and change:
at line 145
```php

if (!$upload->receive()) {

```
To:
```php

if (!$upload->receive($file)) { 

```

Or alternatively I have put together a small module to override this bit of code. If you want it drop me a comment and I will package it up.
