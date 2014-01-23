---
layout: post
status: publish
published: true
title: Magento Block Caching Cache Key Helper Method - Generate Safe Unique Cache
  Keys
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3725
wordpress_url: http://www.edmondscommerce.co.uk/?p=3725
date: 2012-12-04 12:21:44.000000000 +00:00
categories:
- magento
tags:
- speed
- performance
- key
- generator
- method
- class
- block
- optimisation
- caching
- cache
- improve
- helper
---
If you do any work at all on Magento performance optimisation with a view to making pages load faster then you must have come across block caching. To understand block caching you need to first of all understand that a Magento page is actually made up of a lot of nested chunks called blocks.

Blocks can have their HTML generated dynamically every time though it is also possible to make Magento cache the block HTML output so that it loads a LOT faster, especially with heavy and slow blocks such as best sellers etc.

When setting up block caching, you need to specify a cache key. If your cache key is not unique enough then there is a risk that you will display the wrong cache for a particular scenario. 

For this reason I created a block caching helper with this method that can generate a very unique cache key based on the current block usage.
/app/code/local/EdmondsCommerce/Helper/Data.php
```php

/**
     * Generate a nice unique block cache key
     *
     * @param Mage_Core_Block_Abstract $block
     * @return string
     */
    public function ecCacheKey(Mage_Core_Block_Abstract $block){
        $class = get_class($block);
        $template = $block->getTemplateFile();
        $md5 = md5(var_export($block->getData(), true));
        $params = trim(implode(",", $block->getRequest()->getParams()), ',');
        $category=($block->getCurrentCategory())?$block->getCurrentCategory()->getName():'no-category';
        $store_id = Mage::app()->getStore()->getId();
        return 'edmondscommerce-'. $params . '-'. $category . '-' . $store_id . '-' . $class.'-'.$template.'-'.$md5;
    }

```

You would use this in the following way:

In a block class, set up the following:
```php

    public function _construct(){
        parent::_construct();
        $this->addData(array(
            'cache_lifetime' => 999999999,
            'cache_tags' => array(Mage_Catalog_Model_Product::CACHE_TAG, Mage_Catalog_Model_Category::CACHE_TAG),
            'cache_key' => Mage::helper('blockcaching')->ecCacheKey($this)
        ));

    }

```
