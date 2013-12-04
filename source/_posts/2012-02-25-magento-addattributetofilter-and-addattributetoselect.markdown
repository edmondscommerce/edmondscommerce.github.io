---
layout: post
status: publish
published: true
title: Magento addAttributeToFilter() and addAttributeToSelect()
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2978
wordpress_url: http://www.edmondscommerce.co.uk/?p=2978
date: 2012-02-25 19:49:58.000000000 +00:00
categories:
- magento
tags:
- php
- magento
- developer
- sql
- ecommerce
- debugging
---
These two  Magento functions looks more like there is no obvious difference between them, but there is.

addAttributeToFilter('some_attribute1','attribute_value') filters a Magento entity collection (e.g Products, categories) by only selecting entities that has 'some_attribute' equal to 'attribute_value' while

addAttributeToSelect('some_attribute2')  tells Magento to return add 'some_attributes' to the set of properties that would be returned for a collection of entities.

A combination of these two functions could be  likened to ```sql
SELECT 'some_attribute2' FROM Table WHERE 'some_attribute1'='attribute_value'
```
