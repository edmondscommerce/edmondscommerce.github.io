---
layout: post
status: publish
published: true
title: Magento API fix - Get Product by SKU
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2481
wordpress_url: http://www.edmondscommerce.co.uk/?p=2481
date: 2011-07-08 11:36:51.000000000 +01:00
categories:
- magento
tags:
- php
- magento
- ecommerce
- api
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
I have just finished working on a nice little project for Magento API for our client CNG Florist Sundries.

The Aim of the project was to make Magento API use SKU's when pulling out the product information. By default Magento API accept a variable productId which can either be a product id or sku. The problem, especially with this task, was the fact that the client is using numeric values for product SKU values. 

Now when he used third party system to update his catalog by passing SKU values, Magento was assuming the values are productId and consequently updating the wrong products. Our fix will simply force Magento to look for SKU's first and return the correct product ID for the required product.

The client site is <a href='http://www.cngfloristsundries.co.uk/'>www.cngfloristsundries.co.uk</a>

