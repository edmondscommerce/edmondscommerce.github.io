---
layout: post
status: publish
published: true
title: PHPUnit, LAMP, Magento and Netbeans
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2786
wordpress_url: http://www.edmondscommerce.co.uk/?p=2786
date: 2012-01-10 13:11:10.000000000 +00:00
categories:
- netbeans
tags:
- php
- testing
- magento
- netbeans
- xampp
- ide
- phpunit
- unit testing
---
When using PHPUnit with xampp the first the to do is install PHPUnit through pear. You usually need to update pear first, after that you should be able to follow the instructions <a href="http://pear.phpunit.de/">here</a>

Getting PHPUnit working with Magento is fairly straight forward. It's just a case of including Mage.php and then calling Mage::app(); in the setup method of your test class:

```php
<?php

require_once '../app/Mage.php';

class TemplateTest extends PHPUnit_Framework_TestCase {

    public function setUp() {
        Mage::app();
    }

    public function testExample() {
        $helper = Mage::helper('core');
        $this->assertTrue($helper instanceof Mage_Core_Helper_Data, "Magento isn't running!");
    }
}
```

If you use NetBeans as your IDE you'll be glad to know that it has support for running your tests directly without having to use a terminal. This does require a bit of configuration. You need to tell NetBeans where the PHPUnit script is under Tools > Options > PHP > Unit Testing. If you are using it with XAMPP it will be located at /opt/lampp/bin/phpunit. To begin running the tests you then go Run > Test Project and NetBeans will ask you where your tests are. After that you will get a "Test File" source folder in the Projects pane. You can now right click each test file and choose "Run file" and netbeans will run it. If you have xdebug setup the debug option also works nicely.
