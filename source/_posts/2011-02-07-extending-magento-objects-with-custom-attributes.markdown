---
layout: post
status: publish
published: true
title: Extending Magento Objects with Custom Attributes
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2121
wordpress_url: http://www.edmondscommerce.co.uk/?p=2121
date: 2011-02-07 18:27:50.000000000 +00:00
categories:
- magento
tags:
- mysql
- magento
- custom
- eav
- config.xml
- order
- attribute
- installer
---
It's fairly common that you need to add in some custom data to a Magento object. 

The most common scenario is products and its totally handled via the admin side. However if you need to extend something like the order object to store custom order information then things get a little bit more tricky, but it's fairly easy still.

If you are extending an order, you also need to make sure that you extend in the "flat table" way as opposed to the standard EAV way otherwise things won't work as you expect.

If you just want to add in a simple text attribute then you can do the following:

1. Edit your config.xml and set up the installer section, the following needs to be within the 

``` xml
<global></global>
```
 tags

```xml

<!-- RESOURCES - Install etc //-->
        <resources>
            <custommodule_setup>
                <setup>
                    <module>EdmondsCommerce_CustomModule</module>
                    <!--
                    	Points to
                    	app/code/local/EdmondsCommerce_CustomModule/sql/custommodule_setup/mysql4-install-0.0.1.php

                    	Sets mysql4-install-0.1.0.php to be a class of type Mage_Sales_Model_Mysql4_Setup
                    	Passes 'core_setup' as a connection 'type' :)
                    -->
                    <class>Mage_Sales_Model_Mysql4_Setup</class>
                </setup>
                <connection>
                    <use>core_setup</use>
                </connection>
            </custommodule_setup>
        </resources>

```

Note this bit:
<class>Mage_Sales_Model_Mysql4_Setup</class>

Its important you specify the correct setup model for the object you are extending. Just take a look at the core module config.xml file to find out. In the above example we are setting up to extend the order object which uses the flat table storage system.

2. Your installer file
app/code/local/EdmondsCommerce/CustomModule/sql/custommodule_setup/mysql4-install-0.1.0.php

```php

<?php
/* @var $installer Mage_Sales_Model_Mysql4_Setup */
$installer = $this;

$installer->startSetup();

/**
* Adds an attribute of the code custommodule_info to the order object
* As this is a flat table, it adds the column to the table for you
**/
$installer->addAttribute('order', 'custommodule_info', array('type'=>'text'));

$installer->endSetup();

```

Then access any Magento page and your installer should run and update the schema for you.
