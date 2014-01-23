---
layout: post
title: "Preorders in Magento Using Attribute Value"
date: 2014-01-23 15:52:41 +0000
comments: true
author: kenneth
categories: magento
tags: 
description: 
---

Magento doesn't come built with the ability to place preorders: the closest match is in the form of back orders, but there's a crucial difference between the two. Backorders are orders placed when stock isn't present and are shipped as soon as stock becomes available. Preorders however usually have a predefined point at which they will be shipped.

The excellent [Aitoc Prorders](http://www.aitoc.com/en/magentomods_pre_order.html) extension provides a drop-in ability to accept preorders including button text changes, checkout customisation and different order statuses for preorders.

One aspect I had to work around is that the way to define a preorder is by using the extra "Pre-Orders" value of the Magento "Backorders" Inventory field. In my case I wanted to define a preorder to be a product with a Release Date set in the future. Fortunately the Aitc Preorders module has a very discrete function where it holds the definition of a Preorder. Changing this is a simple case of overriding that method

###Creating a new extension

You need to create a new standard Magento extension, creating the usual boilerplate files:

- /app/etc/modules/Namespace_Module.xml
- /app/code/local/Namespace/Module/etc/config.xml

###Rewrite the Aitoc module's Product model

In /app/code/local/Namespace/Module/etc/config.xml, set up your XML:

{% codeblock lang:xml %}
<?xml version="1.0"?>
<config>
    <modules>
        <Namespace_Module>
            <version>0.1.0</version>
        </Namespace_Module>
    </modules>
    <global>
        <models>
            <catalog>
                <rewrite>
                    <product>Namespace_Module_Model_Aitpreorder_Rewrite_CatalogProduct</product>
                </rewrite>
            </catalog>
        </models>
    </global>
</config>   
{% endcodeblock %}

###Create the class and override the function

Create the file /app/code/local/Namespace/Module/Model/Aitpreorder/Rewrite/CatalogProduct.php

{% codeblock lang:php %}

<?php

class Namespace_Module_Model_Aitpreorder_Rewrite_CatalogProduct extends Aitoc_Aitpreorder_Model_Rewrite_CatalogProduct {
    public function getPreorder()
    {
        // Add whatever logic you like here and return it as a boolean
        $releaseDate = DateTime::createFromFormat('Y-m-d H:i:s', $this->getReleaseDate());
        return $releaseDate > new DateTime();
    }

}

{% endcodeblock %}

