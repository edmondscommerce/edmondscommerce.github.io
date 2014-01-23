---
layout: post
status: publish
published: true
title: 'Magento bug: custom option values not showing in backend'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3319
wordpress_url: http://www.edmondscommerce.co.uk/?p=3319
date: 2012-08-22 10:41:09.000000000 +01:00
categories:
- magento
tags:
- php
- bug
- problem
- magento
- solution
- fix
- tip
---
It's a little bit annoying that such a core feature is just broken in many versions of magento - the headings for the custom options chosen, whilst fully working on the cart; checkout and emails to the customer, only show the heading and no content on the backend order.

There are a couple of fixes :
in 
  app/code/core/Mage/Adminhtml/Block/Sales/Items/Column/Name.php
there is no extending, so you can copy it to 
  app/code/local/Mage/Adminhtml/Block/Sales/Items/Column/Name.php 
and add the following class method :
```php

public function getFormattedOption($value) {
  $_remainder = '';
  $value = Mage::helper('core/string')->truncate($value, 55, '', $_remainder);
  $result = array(
    'value' => nl2br($value),
    'remainder' => nl2br($_remainder)
  );
  return $result;
}

```

and/or change the admin theme in 
  app/design/adminhtml/default/default/template/sales/items/column/name.phtml
around about line 44 from :
```php

<?php $_option = $this->getFormattedOption($_option['value']); ?>

```
to
```php

<?php if (!is_null($this->getFormattedOption($_option['value']))) {
    $_option = $this->getFormattedOption($_option['value']);
} ?>

```

Then the custom options chosen by customers will happily show in the backend.
