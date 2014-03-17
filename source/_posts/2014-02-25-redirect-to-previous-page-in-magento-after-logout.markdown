---
layout: post
title: "Redirect to previous page in Magento after logout"
date: 2014-02-25 15:58:02 +0000
comments: true
author: kenneth
categories: 
 - magento
tags:
 - magento
 - logout
 - redirect
description: Redirecting a user to their previously viewed page after having logged out
---

By default Magento sends a user to a logoutSuccess page after they choose to log out. This is 'hard-baked' into the Customer controller's logout action in the line `$this->_redirect('*/*/logoutSuccess');`. You can choose to set the Javascript redirect in the template `customer/logout.phtml`, but a better idea is to bypass the logout success page entirely.

The way to do this is to override the `logoutAction()` method in the `customerController`:

1. [Rewrite the customer controller as documented here](http://www.magentocommerce.com/wiki/5_-_modules_and_development/0_-_module_development_in_magento/how_to_overload_a_controller)
- Override the `logoutAction()` method
- Set the redirect as below

```php
    <?php
    require_once 'Mage/Customer/controllers/AccountController.php';


    class EdmondsCommerce_LogoutRedirect_AccountController extends Mage_Customer_AccountController {
        public function logoutAction()
        {
            $url = Mage::getSingleton('core/session')->getLastUrl();
            $this->_getSession()->logout()
                ->setBeforeAuthUrl(Mage::getUrl());
    
            $this->_redirectUrl($url);
        }
    }
```
