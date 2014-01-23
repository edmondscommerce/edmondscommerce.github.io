---
layout: post
status: publish
published: true
title: Magento Custom Product Type as Configurable Product
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2882
wordpress_url: http://www.edmondscommerce.co.uk/?p=2882
date: 2012-01-20 15:36:02.000000000 +00:00
categories:
- magento
tags:
- magento
- custom
- xml
- product
- extension
- type
- configurable
---
If you have created a new product type and need to enable it to be included with configurable products you need to let Magento know that it should allow your product type to work with configurable products. To do this open your config xml and add the following xml.

```xml

<config>
    <global>
        <catalog>
            <product>
                <type>
                    <configurable translate="label" module="catalog">
                        <allow_product_types>
                            <custom_type_name/>
                        </allow_product_types>
                    </configurable>
                </type>
            </product>
        </catalog>
    </global>
</config>

```

This tells Magento to include your product type for use with configurable products.
