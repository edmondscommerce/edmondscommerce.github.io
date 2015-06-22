---
layout: post
title: "Fixing product breadcrumbs in Magento"
date: 2015-06-22 10:13:57 +0100
comments: true
author: dcallagh
categories: 
tags: 
description: 
---

Some times Magento has trouble displaying breadcrumbs for products, there is an override you can added that some times fixes this.

Firstly, if you haven't already. Create a new module if you don't already have one in either your local or community directories under app/code.

Create a new observer and assign it the event `catalog_controller_product_init`.

With your observer ready to go, assign the event target to your method of choice on your observer and throw in some code

    public function updateBreadCrumb(Varien_Event_Observer $observer)
    {
        $current_product = Mage::registry('current_product');

        if ($current_product) {
            $categories = $current_product->getCategoryCollection()
                          ->addAttributeToSelect('name')
                          ->setPageSize(1);
            foreach ($categories as $category) {
                Mage::unregister('current_category');
                Mage::register('current_category', $category);
            }
        }
    }

As the code removes and readds the registered categories it will force Magento to regenerate the breadcrumbs.
Unless there is an issue with product categories in the database this should solve the problem.
