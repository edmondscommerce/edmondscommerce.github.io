---
layout: post
status: publish
published: true
title: Magento Flush Everything Cache, Index, Images, JS, CSS in One Go
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3035
wordpress_url: http://www.edmondscommerce.co.uk/?p=3035
date: 2012-03-03 16:26:59.000000000 +00:00
categories:
- magento
tags:
- flush
- magento
- snippet
- image
- cache
- code
- index
- js
- css
- storage
---
If you are developing a Magento store and you would like a method you can call to completely clear everything out that might be cached or indexed etc then you will like this little snippet:

```php

public function flushEverything() {
        Mage::app()->getCacheInstance()->flush();
        Mage::getModel('core/design_package')->cleanMergedJsCss();
        Mage::getModel('catalog/product_image')->clearCache();
        $indexer    = Mage::getSingleton('index/indexer');
        /* @var $indexer Mage_Index_Model_Indexer */
        foreach($indexer->getProcessesCollection() as $process){
              $process->reindexEverything();
        }  
    }

```

This flushes the cache storage, removes merged JS/CSS files, flushes the product image cache then loops through each index and reindexes.

Perhaps overkill but sometimes there's nothing like the use of excessive force!
