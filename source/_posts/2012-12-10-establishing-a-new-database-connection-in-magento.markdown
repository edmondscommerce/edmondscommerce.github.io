---
layout: post
status: publish
published: true
title: Establishing a New Database Connection in Magento
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 3754
wordpress_url: http://www.edmondscommerce.co.uk/?p=3754
date: 2012-12-10 15:18:27.000000000 +00:00
categories:
- magento
tags:
- php
- magento
- database
- tip
---
Connecting to a new database in <a href="/platforms/magento">Magento</a> is not the most straight forward of tasks yet it is better structured in other systems that give you no other options. In some systems (such as osCommerce) you would have no choice but to manually create a new PDO object and give it the necessary details.

In Magneto all database connections are defined in the configuration. The connection that you will always have available is 'default_setup' which, by convention, is always defined in app/etc/local.xml.

If you will always want the second database connection available you should consider adding it to app/etc/local.xml. You can also define them in module specific configuration if you desire.

Knowing that the database configuration is nothing more that configuration establishing a new database connection on the fly in code is relatively straight forward. Here is some example code to do this:

```php

<?php
$config = Mage::app()->getConfig();

$originalPrefix = 'global/resources/default_setup';
$newPrefix = 'global/resources/orders_db';

$nodesToCopy = array(
    '/connection/host',
    '/connection/username',
    '/connection/password',
    '/connection/initStatement',
    '/connection/model',
    '/connection/type',
    '/connection/pdoType',
    '/connection/active'
);

foreach($nodesToCopy as $nodeToCopy) {
    $nodeVal = (string)$config->getNode($originalPrefix . $nodeToCopy);
    $config->setNode($newPrefix.$nodeToCopy, $nodeVal);
}

$config->setNode('global/resources/orders_db/connection/dbname', 'import_orders');

$ordersDb = Mage::getSingleton('core/resource')->getConnection('orders_db');

```

In this example the 'default_setup' connection details are copied to a new connection called 'orders_db', then the database for this new connection is changed to 'import_orders'. Having defined the configuration for the database simply get the connection object and Magento will establish the connection for you.
