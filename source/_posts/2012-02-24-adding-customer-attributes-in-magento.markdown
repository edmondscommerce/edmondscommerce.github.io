---
layout: post
status: publish
published: true
title: Adding Customer Attributes in Magento!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2964
wordpress_url: http://www.edmondscommerce.co.uk/?p=2964
date: 2012-02-24 14:19:39.000000000 +00:00
categories:
- php
tags:
- php
- magento
- attributes
---
If you ever need to create a custom field to save data against a customer in Magento you will probably need to create a custom attribute.

Creating the attribute is easy, in your modules install script you do:
```php

<?php
$installer = $this;
$installer->startSetup();
$installer->addAttribute('customer', 'my_custom_attribute', array('type'=>'text'));
$installer->endSetup();

```

Then on the customer object you can update and save it accordingly:
```php

<?php
$customer = Mage::getModel('customer/customer')->load($customerId);

$customer->setMyCustomAttribute("Some custom data that needs to be saved")->save();
echo Mage::getModel('customer/customer')->load($customerId)->getMyCustomAttribute(); // Outputs 'Some custom data that needs to be saved'

```

To make your installer work you need to create a folder in the root of your module sql/mymodule_setup

In there create the file mysql4-install-0.1.0.php

And put the above installer code (plus any other install related code) in there.

You also need to add the following to your modules etc/config.xml file

```xml

        <resources>
            <mymodule_setup>
                <setup>
                    <module>EdmondsCommerce_Mymodule</module>
                    <class>Mage_Sales_Model_Mysql4_Setup</class>
                </setup>
                <connection>
                    <use>core_setup</use>
                </connection>
            </mymodule_setup>
        </resources>


```
