---
layout: post
status: publish
published: true
title: Get Magento Version on the Command Line
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3820
wordpress_url: http://www.edmondscommerce.co.uk/?p=3820
date: 2013-01-03 16:37:16.000000000 +00:00
categories:
- magento
tags:
- php
- magento
- mage
- bash
- CLI
- version
- number
---
If you just want to get the Magento version on the command line quickly try this one liner:

```bash

php -r &quot;require 'app/Mage.php'; echo Mage::getVersion(); &quot;

```

Does exactly what you need
