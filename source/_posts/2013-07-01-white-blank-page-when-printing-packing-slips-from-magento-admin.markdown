---
layout: post
status: publish
published: true
title: White Blank Page when Printing Packing Slips from Magento Admin
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4397
wordpress_url: http://www.edmondscommerce.co.uk/?p=4397
date: 2013-07-01 14:21:49.000000000 +01:00
categories:
- magento
tags:
- magento
- zend
- packing slips
- white blank page
---
If you're having trouble printing packing slips, receiving a white blank page when selecting Print Packingslips from the Actions menu in Magento's Sales Orders page, then it's likely you're having the same issue I've had.

I found that having error_reporting enabled wasn't enough

```php

error_reporting(E_ALL | E_STRICT);

```

You'll also need to add this to your index.php:

```

ini_set('display_errors', 1);

```

You'll then be shown the following fatal error:

```

Fatal error: Declaration of Zend_Pdf_FileParserDataSource_File::__construct() must be compatible with Zend_Pdf_FileParserDataSource::__construct() in /home8/stonecr2/public_html/newsite/lib/Zend/Pdf/FileParserDataSource/File.php on line 41

```

The issue here is that the contructor of Zend_Pdf_FileParserDataSource_File requires a single paramter, $filePath, whereas its abstract class's constructor does not. To resolve this, we need to make sure the abstract class matches its implementation, so make the following change

```php


//from
abstract public function __construct();

//to
abstract public function __construct($filePath);


```

Test your printing, and you should be provided with a PDF file.
