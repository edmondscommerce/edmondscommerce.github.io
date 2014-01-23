---
layout: post
status: publish
published: true
title: Magento URL Request Routing
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2851
wordpress_url: http://www.edmondscommerce.co.uk/?p=2851
date: 2012-01-17 16:13:03.000000000 +00:00
categories:
- magento
tags:
- seo
- development
- php
- magento
- apache
- mod_rewrite
- url
- mvc
---
Magento is a typical PHP Model View Architecture (MVC) system which routes its URLs in ways not particularly different from other PHP MVC Frameworks like codeigniter, symphony etc. But the difference it has with other MVC architecture is that most of its routing directives or configurations are XML based i.e. found in one XML file or the other.

For example, www.yourstore.co.uk/index.php/checkout/cart/index, tells Magento to use the checkout module found in app/code/Mage/,  use the cart controller (i.e. CartController.php) in app/code/Mage/Checkout/controller/ and run the index action method in the CartController.php, when the last "index" is omitted Magento still defaults to run the index action method, and every other value in the url after the first three url steps, Magento treats them as PHP GET parameters i.e. www.yourstore.co.uk/index.php/checkout/cart/index/store/1 would make $_GET['store']=1

It is this action method that searches through the magneto xml configuration file using x-path to obtain information regarding this request e.g. the indexAction method found in app/code/Mage/Checkout/controller/CartController.php uses  Mage::getStoreConfig('sales/minimum_order/description') to get the value of the description node  in sales module, the minimum_order node and description child node, which can be found in system.xml in the Sales/etc/ folder.

Its is worthwhile also knowing that Magento uses Apache's URL rewrite engine (mod_rewrite) to make its URLs SEO friendly i.e. www.yourstore.co.uk/index.php/catalog/product/view/id/1 could be routed to www.yourstore.co.uk/index.php/product1.html which can be regarded as an alias for  www.yourstore.co.uk/index.php/catalog/product/view/id/1 to make Google happy and improve the sites SEO.

This basically describes how Magento decides what to do when accessed by a particular URL.



