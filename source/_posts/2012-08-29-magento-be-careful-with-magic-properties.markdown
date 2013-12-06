---
layout: post
status: publish
published: true
title: 'Magento: Be Careful with Magic Properties'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3352
wordpress_url: http://www.edmondscommerce.co.uk/?p=3352
date: 2012-08-29 14:14:53.000000000 +01:00
categories:
- magento
tags:
- php
- magento
- property
- oo
- magic method
---
In certain places in Magento, you can simply access the data from an object by property, but <strong>beware</strong>!

For instance, in the product template the following two code snippets have the same effect :-
```php
$_qty = $_product->stock_item->stock_qty;
```
and
```php
$_qty = $_product->getStockItem()->getStockQty();
```

However only the latter will work if you call it from the category view.  This is because the product is not fully loaded, and even doing a 
```php
$_newproductobject = Mage::getModel('catalog/product')->load($_product->getId());
```
will not help!

So the moral of this is, use the getters not the magic property.
