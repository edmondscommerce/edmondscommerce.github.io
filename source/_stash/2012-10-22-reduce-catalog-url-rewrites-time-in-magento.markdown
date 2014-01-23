---
layout: post
status: publish
published: true
title: Reduce Catalog URL Rewrites Time in Magento
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3460
wordpress_url: http://www.edmondscommerce.co.uk/?p=3460
date: 2012-10-22 16:40:10.000000000 +01:00
categories:
- magento
tags:
- seo
- development
- php
- problem
- magento
- solution
- urls
- helpful tips
---
I recently had a client that wanted to remove the category structure from their product urls.

There is a option to do this in the admin, but they wanted to redirect all of the existing urls to the shorter one.

The way that I wanted to do this was to truncate the current core_url_rewrite table and regenerate the urls with the "Use Categories Path for Product URLs" set to no, and then override the 404 controller to redirect to the correct url.

However, after the urls were generated, I found that all of the urls including the category path were still included, which meant that the override would not work.

After spending quite a bit of time looking for a way to get round this, I put together a simple override to prevent the category path urls from getting generated. 

This had the added benefit of reducing the number of entries in the core_url_rewite table from ~2k entries to under 500, which cut the amount of time that was needed to generate it.

The code is below for anyone else that needs to use this in the future. There are three files in total, set up like this

```php

EdmondsCommerce/
`-- Redirects
    |-- controllers
    |   `-- Cms
    |       `-- IndexController.php
    |-- etc
    |   `-- config.xml
    `-- Model
        `-- Catalog
            `-- Url.php

```

This is the code for the Model

```php

class EdmondsCommerce_Redirects_Model_Catalog_Url 
  extends Mage_Catalog_Model_Url {

    /**
     * This method is called each time that a url 
     * is generated for a product. It is called for the 
     * root category and each category that the product is in.
     * 
     * This code checks to see if the category passed to it is
     * the root category. If it is it will 
     * add the url rewrite as normal. If not it does nothing
     * 
     * @param Varien_Object $product
     * @param Varien_Object $category
     */
    protected function _refreshProductRewrite(Varien_Object $product, Varien_Object $category) {
        $rootCategory = $this->getStoreRootCategory($category->getStoreId());
        if($category->getId() == $rootCategory->getId()) {
            parent::_refreshProductRewrite($product, $category);
        }
    }
}

```

If you want to redirect from the existing urls to the new ones, you will need to use the following controller

```php

include_once('Mage/Cms/controllers/IndexController.php');

class EdmondsCommerce_Redirects_Cms_IndexController 
extends Mage_Cms_IndexController {

    /**
     * This checks to see if the site can redirect
     * before displaying a 404
     * @param type $coreRoute
     */
    public function noRouteAction($coreRoute = null) {
        // Get the request
        $request = $_SERVER['REQUEST_URI'];
        // Strip off get params if there are any
        if (strpos($request, '?') !== FALSE) {
            $request = substr($request, 0, strpos($request, '?'));
        }
        /**
         *  This makes sure that no part of the request is included
         *  in the base url. This should help
         *  the system work if it is running from a sub folder
         */
        $parts = explode('/', Mage::getBaseUrl());
        foreach ($parts AS $part) {
            $request = str_replace(array($part, '//'), '', $request);
        }
        /*
         * Combine the request with the base path to get the full url
         * and remove any trailing slashes
         */
        $path = trim(str_replace('http:/', 'http://', str_replace('//', '/', Mage::getBaseUrl() . $request)), '/');
        //Get the last section which should be the product title
        $cleanedPath = explode('/', $path);
        $key = array_pop($cleanedPath);
        //Here we find url keys like the title
        $collection = Mage::getModel('catalog/product')->getCollection();
        $collection->addAttributeToSelect('url_key');
        $collection->addFieldToFilter(array(
            array('attribute' => 'url_key', 'like' => "$key")));
        $products = $collection->load();
        /*
         * Proceed if there is only 1 result, if there are more we
         * don't know which one is correct
         */
        if (count($products) == 1) {
            foreach ($products AS $product) {
                $url = Mage::getBaseUrl(Mage_Core_Model_Store::URL_TYPE_WEB) . $product->getUrlKey();
                //Check to make sure the url is not the same as the path, should prevent infinite redirects
                if ($path != $url) {
                    header('HTTP/1.1 301 Moved Permanently');
                    header('Location: ' . $url);
                    die();
                }
            }
        }
        // Could not find a suitable url carry out the 404
        parent::noRouteAction($coreRoute);
    }

}

```

Then use the following xml file

```xml

<?xml version="1.0"?>
<config>
    <modules>
        <EdmondsCommerce_Redirects>
            <version>0.1.0</version>
            <depends></depends>
        </EdmondsCommerce_Redirects>
    </modules>
    <global>
        <models>
            <redirects>
                <class>EdmondsCommerce_Redirects_Model</class>
            </redirects>
            <catalog>
                <rewrite>
                    <url>EdmondsCommerce_Redirects_Model_Catalog_Url</url>
                </rewrite>
            </catalog>
        </models>
    </global>
    <frontend>
        <routers>
            <cms>
                <args>
                    <modules>
                        <EdmondsCommerce_Redirects before="Mage_Cms">EdmondsCommerce_Redirects_Cms</EdmondsCommerce_Redirects>
                    </modules>
                </args>
            </cms>
        </routers>
    </frontend>
</config>

```
