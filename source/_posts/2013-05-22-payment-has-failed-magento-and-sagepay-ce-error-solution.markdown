---
layout: post
status: publish
published: true
title: Payment has failed... Magento and SagePay CE Error + Solution
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4270
wordpress_url: http://www.edmondscommerce.co.uk/?p=4270
date: 2013-05-22 14:58:25.000000000 +01:00
categories:
- magento
tags:
- php
- problem
- magento
- solution
- sagepay
- tip
---
I recently upgraded a magento store and installed the Sage Pay Suite CE module from EbizMarks.

The following error came up twice during the testing of the module, once in the frontend and once in the admin.

<strong>Payment has failed, please reload checkout page and try again. Your card has not been charged</strong>

The error itself is triggered from the saveAfter method in the Ebizmarts_SagePaySuite_Model_Observer_Sales class and is called every time an order is saved.

The error on the frontend was caused by a javascript error. Adding the following to the top of the sagePaySuite_Checkout.js file corrected it

```javascript

if(typeof sagePayIsMobile == 'undefined') {
    var sagePayIsMobile = function() {
        return (navigator.userAgent.match(/BlackBerry/i) ||
            navigator.userAgent.match(/webOS/i) ||
            navigator.userAgent.match(/Android/i) ||
            navigator.userAgent.match(/iPhone/i) ||
            navigator.userAgent.match(/iPod/i) ||
            navigator.userAgent.match(/iPad/i));
    }
}

```

The error in the admin was caused by a different extension being called when the order was saved. Normally the extension ensures that the method is not called when it is not needed and this is done by checking the route and the registry. If an extension saves the order these checks are not triggered so you will need to add in your own. To do that you will need add the following code to the action that is saving the error

```php

Mage::register('skipSagePay', TRUE);

```

and then change the following line in the Ebizmarts/SagePaySuite/Model/Observer/Sales.php file

```php

if( (Mage::app()->getRequest()->getControllerModule() == 'Mage_Api') || Mage::registry('current_shipment') || Mage::registry('sales_order') || Mage::registry('current_creditmemo') || Mage::registry('current_invoice') || ($order->getPayment()->getMethod() == 'sagepayrepeat') ){

```

to 
```php

if( (Mage::app()->getRequest()->getControllerModule() == 'Mage_Api') || Mage::registry('current_shipment') || Mage::registry('sales_order') || Mage::registry('current_creditmemo') || Mage::registry('current_invoice') || ($order->getPayment()->getMethod() == 'sagepayrepeat') || Mage::registry('skipSagePay')){

```
