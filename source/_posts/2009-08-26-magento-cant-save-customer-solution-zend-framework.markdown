---
layout: post
status: publish
published: true
title: Magento Can't Save Customer + Solution (Zend Framework)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1166
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1166
date: 2009-08-26 09:35:41.000000000 +01:00
categories:
- magento
tags:
- php
- zend framework
- magento
- can't save customer
- include path
---
If you are getting a weird "cant' save customer" message in your local Magento development environment when trying to save a new account, but the bug is not on your live store, this might be the solution..

If like me you not only develop Magento sites but also use Zend Framework for other projects (which Magento is based upon) then you might find that there are some clashes between your version of Zend Framework and the Magento version.

For Magento development, you need to be sure that your Magento install is using its own version of Zend Framework and not your own separate copy. To do this you have a choice of either changing your php include path to remove your separate Zend Framework folder or alternatively edit the top of app/Mage.php and make this edit edit on line 31.

```php

//Mage::register('original_include_path', get_include_path());
Mage::register('original_include_path', '');

```
