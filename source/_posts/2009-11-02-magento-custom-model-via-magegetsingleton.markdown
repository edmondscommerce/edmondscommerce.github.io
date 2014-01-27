---
layout: post
status: publish
published: true
title: Magento Custom Model via Mage::getSingleton()
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1234
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1234
date: 2009-11-02 16:44:05.000000000 +00:00
categories:
- magento
tags:
- magento
- custom
- model
- singleton
- mage
---
If you are trying to load a custom model using the build in Mage::getSingleton() method and are struggling because it keeps looking in the Mage/ directory for your model instead of your custom model, the best solution I found was simply to put the entire class name of the model.

eg doesn't work:

```php

//trying to load EC/Custom/Model/Blah.php
Mage::getSingleton('EC_custom/blah');

```

does work
```php

//trying to load EC/Custom/Model/Blah.php
Mage::getSingleton('EC_Custom_Model_Blah');

```

