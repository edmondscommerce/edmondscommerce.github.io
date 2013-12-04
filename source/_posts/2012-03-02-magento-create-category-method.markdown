---
layout: post
status: publish
published: true
title: Magento Create Category Method
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3033
wordpress_url: http://www.edmondscommerce.co.uk/?p=3033
date: 2012-03-02 18:30:04.000000000 +00:00
categories:
- magento
tags:
- function
- magento
- method
- category
- create
- helper
- handy
---
Ideal to drop into a helper, this is a simplified create category method.

You need to specify the name, store_id and parent category id and can optionally set to active, anchor and change the display mode if you wish.

```php

public function createCategory($name, $store_id, $parent_id, $active = 0, $anchor = 0, $display_mode='PRODUCTS') {
        $parent = Mage::getModel('catalog/category')->load($parent_id);
        if($parent->getId() != $parent_id){
            Mage::helper('exception')->except('Failed to load parent category', 'Fatal');
        }
        $category = Mage::getModel('catalog/category');
        /* @var $category Mage_Catalog_Model_Category */
        $category
                ->setStoreId($store_id)
                ->setPath($parent->getPath())
                ->setName($name)
                ->setUrlKey($name)
                ->setIsActive($active)
                ->setIsAnchor($anchor)
                ->setDisplayMode($display_mode)
                ->setAttributeSetId($category->getDefaultAttributeSetId())
        ;
        $category->save();
        return $category;
    }

```
