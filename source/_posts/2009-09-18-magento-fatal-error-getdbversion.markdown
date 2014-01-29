---
layout: post
status: publish
published: true
title: Magento Fatal Error getDbVersion()
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1188
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1188
date: 2009-09-18 15:40:28.000000000 +01:00
categories:
- magento
tags:
- magento
- getDbVersion()
- fatal
- error
---
If you get an error message like this:

```

Fatal error: Call to a member function getDbVersion() on a non-object in /var/www/magento/app/code/core/Mage/Core/Model/Resource/Setup.php on line 136

```

Then it looks like your app/etc/config.xml file has been corrupted somehow. 

Restore this file from a backup or otherwise replace it and hopefully you should be back in business.
