---
layout: post
status: publish
published: true
title: Encryping data with Magento!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2971
wordpress_url: http://www.edmondscommerce.co.uk/?p=2971
date: 2012-02-24 15:19:41.000000000 +00:00
categories:
- magento
tags:
- php
- magento
- crypto
- encryption
---
Encrypting a string in Magneto is really easy and will use the encryption key specified in the local.xml file:

```php

<?php
$encryptedData = Mage::helper('core')->encrypt("This will be encrypted");

```

There is one problem that you may encounter that can be a little bit problematic but there is an easy work around. The encryption process will strip out non-printing characters or character it does not recognise. Easiest way to get about this is to base64 encode what you are about to encrypt:

```php

<?php
$encryptedData = Mage::helper('core')->encrypt(base64_encode("\n\rI start with a carriage return"));

```

Decrypting is just as easy:

```php

<?php
$decyptedData = Mage::helper('core')->decrypt($encryptedData);

```

Remember to base64_decode after decryption if you did base64 encode before encryption:
```php

<?php
$decyptedData = base64_decode(Mage::helper('core')->decrypt($encryptedData));

```
