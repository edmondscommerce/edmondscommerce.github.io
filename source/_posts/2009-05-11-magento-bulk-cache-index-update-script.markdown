---
layout: post
status: publish
published: true
title: Magento Bulk Cache / Index Update Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 380
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=380
date: 2009-05-11 15:00:46.000000000 +01:00
categories:
- magento
tags:
- magento cache
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are doing any kind of bulk updating etc then you also need to make sure that you rebuild all of the caches and indexes after your bulk updates otherwise things can go wrong. 

I have just managed to get the following script to work including when flat catalog is enabled (thanks to <a href="http://www.nicksays.co.uk/2009/02/testing-magento-modules/" target="_blank">Nick of Meanbee</a> for the Mage::app() tip).

This script can be called from the browser (I would highly recommend some form of IP restriction or other security) or called from a cron job. 
```php

<?php
$magePath = '/path/to/Mage.php';
require_once $magePath;
//Varien_Profiler::enable();
//Mage::setIsDeveloperMode(true);
//ini_set('display_errors', 1);
umask(0);

Mage::app()->setCurrentStore(Mage_Core_Model_App::ADMIN_STORE_ID); 

echo '<h3>Cleaning overall Cache</h3>';

flush();
// clean overall cache
Mage::app()->cleanCache();
echo 'done';

flush();
echo '<h3>Cleaning Catalog Rewrites</h3>';

flush();
// clear 'refresh_catalog_rewrites':
//Mage::getSingleton('catalog/url')->refreshRewrites();
Mage::getModel('catalog/url')->refreshRewrites();
echo 'Catalog Rewrites was refreshed succesfuly<br>';

flush();
echo '<h3>Cleaning Image Cache</h3>';

flush();
//  clear 'clear_images_cache':
Mage::getModel('catalog/product_image')->clearCache();
echo 'Image cache was cleared succesfuly<br>';

flush();
echo '<h3>Cleaning Layered Navigation</h3>';

flush();
//  clear 'refresh_layered_navigation':
Mage::getSingleton('catalogindex/indexer')->plainReindex();
echo 'Layered Navigation Indices was refreshed succesfuly<br>';

flush();
echo '<h3>Clearing out Search Index</h3>';

flush();
Mage::getModel('catalogsearch/fulltext')->rebuildIndex();
echo 'Search index was rebuilt succesfully<br>';

flush();
echo '<h3>Rebuilding Flat Category</h3>';
Mage::getResourceSingleton('catalog/category_flat')->rebuild();
echo 'flat category was rebuilt successfully<br>';

flush();
echo '<h3>Rebuilding Flat Products</h3>';
Mage::getResourceSingleton('catalog/product_flat_indexer')->rebuild();
echo 'flat product was rebuilt successfully<br>';

flush();

```<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://ecommerce.aheadworks.com/blog/2009/05/magento-world-newsletter-may-5-2009/" rel="nofollow">Magento World Newsletter (May 5, 2009)</a><br><a href="http://kernelhack.com/?p=37" rel="nofollow">How to add custom fields to <b>Magento</b> checkout | KERNELHACK.com</a><br><a href="http://www.magento.cn/111/ecommerce-seo/magento-stores-ecommerce-search-engine-optimization/" rel="nofollow"><b>Magento</b> Stores Ecommerce Search Engine Optimization, <b>Magento</b> store <b>...</b></a><br></div>
