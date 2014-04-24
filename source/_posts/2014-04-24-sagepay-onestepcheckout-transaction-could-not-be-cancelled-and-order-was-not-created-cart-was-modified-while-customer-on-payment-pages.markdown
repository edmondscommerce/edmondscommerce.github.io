---
layout: post
title: "SagePay, OneStepCheckout, 'Transaction could not be cancelled and order was not created, cart was modified while customer on payment pages'"
date: 2014-04-24 19:17:35 +0100
comments: true
author: ross
categories: 
 - magento
tags: 
 - SagePay
 - OneStepCheckout
 - Bugs
 - Problems
 - Solutions
description: "Fixing a cryptic error when using SagePay and the OneStepCheckout in Magento"
---
I spent this morning dealing with a Magento sit that was unable to process Credit Card payments when they were placed with SagePay.

When a customer tried to place an order they were able to enter that card details, but were then presented with an alert with the following message                                                        

>Your order could not be completed, please try again. Thanks.

They were using the [EbizMarts SagePay CE Module](https://github.com/ebizmarts/sage-pay-suite-ce), so I had a look around to see if the error was known

It appears that a recent release of the SagePay Module introduces some additional checks before creating the order and the current release of the [OneStepCheckout](http://www.onestepcheckout.com/) is not compatible with this.

If you look straight at the SagePay Logs you may also see the following errors, which may indicate the same problem.

 * DEBUG: 4028 : The related transaction cannot be found.
 * DEBUG: Your order could not be completed, please try again. Thanks.
  * CRIT: Transaction XXXXXXXXX-XXXX-XX-XX-XX-XX-XX could not be cancelled and order was not created, cart was modified while customer on payment pages.



Thankfully there is a simple fix for this. In the **app/code/local/Idev/OneStepCheckout/controllers/IndexController.php** file you need to add the following line to the indexAction method

``` php
Mage::getSingleton('checkout/session')->setCartWasUpdated(false);
```

Just before

``` php
$this->loadLayout();
```

and then everything will work correctly.


