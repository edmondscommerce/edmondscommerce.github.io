---
layout: post
status: publish
published: true
title: '"Base table or view already exists: 1050 Table ‘*’ already exists" After Deleting
  Tables'
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 3834
wordpress_url: http://www.edmondscommerce.co.uk/?p=3834
date: 2013-01-08 16:27:02.000000000 +00:00
categories:
- magento
tags:
- mysql
- table
- magento
- database
- pdoexception
---
If for example you're removing an extension and want to clear out its information from the database, you'll need to establish the rows and tables it's inserted, as well as some standard Magento table entries.

So you've removed everything, cleared your cache and now you go to the homepage to check everything is all good, and boom, PDOException:

```
Base table or view already exists: 1050 Table ‘*’ already exists
```

In my case it was `salesrule`, which made me question why it was trying to create the table afresh. The reason I got this is that I'd erroneously removed salesrule_setup from core_resource, and therefore Magento was reinstalling the module. Reinstating the row, and clearing my cache solved the issue
