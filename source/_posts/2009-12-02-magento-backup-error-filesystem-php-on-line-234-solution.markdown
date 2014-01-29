---
layout: post
status: publish
published: true
title: Magento Backup Error Filesystem.php on line 234 + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1275
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1275
date: 2009-12-02 14:33:46.000000000 +00:00
categories:
- magento
tags:
- magento
- error
- backup
---
If you see this error message when trying to access the backups section of Magento Admin:

<b>Warning: Invalid argument supplied for foreach() in /home/*****/public_html/lib/Varien/Data/Collection/Filesystem.php on line 234</b>

Then this simple fix is for you: 

replace (line 24):
```php

foreach (glob($folder . DIRECTORY_SEPARATOR . ‘*’) as $node) {

```

with this:
```php

foreach ((array)glob($folder . DIRECTORY_SEPARATOR . ‘*’) as $node) {

```

I saw this <a href="http://www.simplehelix.com/blog/2009/07/magento-backup-error/">here</a>, so all credit to them.
