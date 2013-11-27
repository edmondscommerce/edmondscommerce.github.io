---
layout: post
status: publish
published: true
title: Netbeans AutoComplete on Magento Objects called by Mage::getModel()
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3019
wordpress_url: http://www.edmondscommerce.co.uk/?p=3019
date: 2012-03-01 11:00:05.000000000 +00:00
categories:
- magento
tags:
- php
- magento
- netbeans
- autocomplete
- ide
- comments
- docblock
- notation
---
As we have been working with the various versions of Magento its nice to see more and more use of DocBlock notation to help IDEs auto suggest and auto complete methods etc when working with objects.

However the style is inconsistent and with a few subtle tweaks would be much, much better.

<h3>Template Files, What is $this?</h3>

First one is the @see syntax often used in .phtml files to describe which block object is in play as $this. Whilst that is useful to read, it is totally useless to the IDE.

For example have a look at 
<b><a href="https://github.com/LokeyCoding/magento-mirror/blob/magento-1.6/app/design/frontend/base/default/template/catalog/product/view.phtml">app/design/frontend/base/default/template/catalog/product/view.phtml</a></b>

```php

/**
 * Product view template
 *
 * @see Mage_Catalog_Block_Product_View
 * @see Mage_Review_Block_Product_View
 */

```

All we need to do is add this underneath
```php

/*
 * @var $this Mage_Catalog_Block_Product_View
 */

```

And now when working with in the .phtml file, $this will auto complete for you.

<blockquote><i>Eagle eyed readers may think that as $this could be either this is perhaps a bad idea, however the Review one actually extends the Catalog one overriding some functionality, it is basically the same.</i></blockquote>

<h3>$Model = Mage::getModel() why always the Abstract?</h3>

Another one that I have just finally figured out is the correct way to get Netbeans to recognise exactly what class an object is when called with Mage::getModel() or Mage::getSingleton().

You might have auto complete suggesting that this is an instance of Mage_Core_Model_Abstract. 

Whilst effectively true, this is unlikely to be useful for you in your context, you need to know exactly what Model class it is.

The reason that Netbeans thinks its Mage_Core_Model_Abstract is because the docblock in 
<b><a href="https://github.com/LokeyCoding/magento-mirror/blob/magento-1.6/app/Mage.php">app/Mage.php</a></b>
describes this as the return value of this method.

```php

    /**
     * Retrieve model object
     *
     * @link    Mage_Core_Model_Config::getModelInstance
     * @param   string $modelClass
     * @param   array $arguments
     * @return  Mage_Core_Model_Abstract
     */
    public static function getModel($modelClass = '', $arguments = array())
    {
        return self::getConfig()->getModelInstance($modelClass, $arguments);
    }

```

I often see blocks of code where the author is attempting to get auto complete working properly by using this syntax

see 
<b><a href="https://github.com/LokeyCoding/magento-mirror/blob/magento-1.6/app/code/core/Mage/Customer/controllers/AccountController.php">app/code/core/Mage/Customer/controllers/AccountController.php</a></b>
createPostAction()
```php

/* @var $customerForm Mage_Customer_Model_Form */
$customerForm = Mage::getModel('customer/form');

```

This is generally the right way to do it, however I think the docblock specifying the return value on Mage:getModel clobbers it.

The simple solution is to move the docblock from above the Mage::getModel call to below it.

```php

$customerForm = Mage::getModel('customer/form');
/* @var $customerForm Mage_Customer_Model_Form */

```

<b>And it works!</b>

{% img  /assets/screenshot4-600x475.png %}
