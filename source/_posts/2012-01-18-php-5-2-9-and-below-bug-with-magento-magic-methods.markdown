---
layout: post
status: publish
published: true
title: PHP 5.2.9 and Below Bug with Magento Magic Methods
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2866
wordpress_url: http://www.edmondscommerce.co.uk/?p=2866
date: 2012-01-18 18:53:29.000000000 +00:00
categories:
- magento
tags:
- php
- bug
- magento
- lamp
---

Just found out this bug that occurs when you try to call an overridden Magento magic methods within the override method. I created a custom attribute for a product with code "price_grid_csv"  and I needed to still call the actual Magento magic method; see the below code

```php

public function getPriceGridCsv(){
$price_csv=parent::getPriceGridCsv();
if(condition)
$price_csv=<further processing of $price_csv>
return $price_csv;
}

```

By default parent::getPriceGridCsv() should return the value of the current object with attribute code price_grid_csv, but it does not because it breaks the camel case structure of the method name by changing getPriceGridCsv to getpricegridcsv which breaks magento from returning the current object attribute with this code.

The way I got around this was by simply calling $this->getData('price_grid_csv') or by running Magento on PHP versions higher than 5.2.9, but I would recommend the first solution in order to make your code PHP version independent.

Also note that  LAMP 1.7.1 is packaged with PHP 5.2.9
