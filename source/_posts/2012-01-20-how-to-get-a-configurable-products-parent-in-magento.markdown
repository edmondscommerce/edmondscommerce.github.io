---
layout: post
status: publish
published: true
title: How to get a configurable products parent in Magento
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2883
wordpress_url: http://www.edmondscommerce.co.uk/?p=2883
date: 2012-01-20 15:19:23.000000000 +00:00
categories:
- magento
tags:
- development
- php
- magento
- magento problem
- solution
- configurable products
---
I recently needed magento to be able to load a product, and if that product was part of a configurable product detect this and return the parent product if that existed. Looking around google I came across this code snippet and thought it should work

```php

$_product = Mage::getModel('catalog/product')->load($productId);
$parentIdArray = $_product->loadParentProductIds()
                 ->getData('parent_product_ids');
if(!empty($parentIdArray)) {
    // do something
}

```

The problem is that the loadParentProductIds method was depreciated in 1.4.2.0 and I'm running 1.6. The new way of doing detecting if a product has a parent is to do this
```php

$configurable_product_model = Mage::getModel('catalog/product_type_configurable');
$parentIdArray= $configurable_product_model->getParentIdsByChild($productId);
if(!empty($parentIdArray)) {
    // do something
}

```

Using this method I overrode the Mage_Catalog_Model_Product class and added this method, which will always return a configurable product if the product is associated with one. Be aware, that if you products belong to more than one configurable product you will have to modify the logic

```php

public function getConfigurableProduct() {
	switch ($this->type_id) {
		case 'configurable':
			return $this;
			break;
		default:
			$configurable_product_model = Mage::getModel('catalog/product_type_configurable');
			$parentId= $configurable_product_model->getParentIdsByChild($this->getId());
			if(isset($parentId[0])) {
				$this->load($parentId[0]);
			}
			break;
	}

	return $this;
}

```
