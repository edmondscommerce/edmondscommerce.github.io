---
layout: post
status: publish
published: true
title: Display out-of-stock products part of a Configurable Product
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3115
wordpress_url: http://www.edmondscommerce.co.uk/?p=3115
date: 2012-05-31 16:39:50.000000000 +01:00
categories:
- magento
tags:
- development
- php
- zend framework
- magento
- developer
- debug
---
In a situation where you want Magento to display out of stock product options of a configurable products, overriding getAllowProducts() function in Mage_Catalog_Block_Product_View_Type_Configurable is where you should be looking, change 
```php

if ($product->isSaleable()) 
{
         $products[] = $product;
}

```
to 
```php
$products[] = $product;
```

Bingo!!!
