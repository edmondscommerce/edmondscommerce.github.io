---
layout: post
status: publish
published: true
title: Magento View SQL For Collection
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1854
wordpress_url: http://www.edmondscommerce.co.uk/?p=1854
date: 2010-10-21 10:46:19.000000000 +01:00
categories:
- magento
tags:
- magento
- sql
- debug
- dump
- eav
- orm
- select
- string
---
If you are working with collections and would like to verify that the actual SQL being used is what you expect it to be then this little tip might prove really handy.

For any collection you can call the method getSelect(). This retrieves the actual Select object that handles the query.

If you cast this select object to a string, you get the raw SQL query, so for example the following is pretty handy:

```php

die(var_dump((string)$collection->getSelect()));

```

This way you can tweak your collection filters etc and check that its doing what you expect it to be doing
