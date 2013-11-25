---
layout: post
status: publish
published: true
title: Adding custom variables to Magento Static Blocks
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2852
wordpress_url: http://www.edmondscommerce.co.uk/?p=2852
date: 2012-01-16 16:02:14.000000000 +00:00
categories:
- magento
tags:
- php
- problem
- magento
- solution
- helpful tips
- static
- blocks
---
I've recently been asked to customise the front page of a magento store. The client wanted the ability to specify a different set of top links depending on whether the customer was logged in or not, and they wanted to be able to changes these links from the admin section. They also wanted the logged in links to display the customers name.

The problem with this is that the standard magento CMS static blocks don't provide access to the customer by default, so I thought I was going to have to build an extension to pass the variables in. However after a little bit of digging, I discovered that this functionality is available as standard in Magento, you just need to set it up!

The way to do this is as follows. Within you template file add in the following code:

```php

$blockToDisplay = $this->getLayout()->createBlock('cms/block')->setBlockId('static_block_id_to_display');
/**
* Here we create an array of custom variables that will be passed to the static block. You can set as many as you
* need and call them whatever makes sense. The important part is in the Static Block you call these like this
* {{var customer_name}}
* Note there are no spaces between the braces and the characters - this is something that caught me out
*/
$customVariables = array();
$customVariables['customer_name'] = Mage::helper('customer')->getCustomerName();
$filter = Mage::getModel('core/email_template_filter');
$filter->setVariables($customVariables);
echo $filter->filter($blockToDisplay->toHtml());

```

This will then display the static block with your variables expanded to values you've set.
