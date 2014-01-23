---
layout: post
status: publish
published: true
title: Get Table Name in Magento (eg with Table Prefix)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1397
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1397
date: 2010-02-18 18:41:22.000000000 +00:00
categories:
- magento
tags:
- magento
- table name
- table prefix
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you use table prefixes (you should) but you need to get the name of a table without having to hardcode in the table prefix, use this little snippet:

```php

$tableName = Mage::getSingleton('core/resource')->getTableName('catalog_product_option');

```
