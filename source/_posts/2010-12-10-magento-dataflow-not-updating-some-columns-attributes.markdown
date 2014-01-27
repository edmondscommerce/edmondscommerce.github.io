---
layout: post
status: publish
published: true
title: Magento Dataflow Not Updating Some Columns / Attributes + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1961
wordpress_url: http://www.edmondscommerce.co.uk/?p=1961
date: 2010-12-10 14:32:20.000000000 +00:00
categories:
- magento
tags:
- magento
- attributes
- solution
- dataflow
- config.xml
- columns
- ignored
- qty_increments
- enable_qty_increments
---
If you are scratching your head trying to figure out why Magento Dataflow seems to be totally ignoring the values you are putting in some columns (for me it was qty_increments and enable_qty_increments) then this is your solution.

In a nutshell, Dataflow totally ignores some columns despite including them in the output file - quite a few actually.

I am planning to release an extension that generally tidies up the behaviour of Dataflow and also includes creation of Attribute Sets and Categories which has come up as a requirement for a client project. However this little nugget of fun has cost me a few hours so I thought I would share the solution straight away.

The columns that are updated by dataflow are controlled by the modules (in this case Mage_Catalog) config.xml file. If you want to enable extra columns you need to create a simple custom module to override that xml.

This is the contents of the config.xml

```xml


<?xml version="1.0"?>
<!--
/**
 * EdmondsCommerce
 * www.edmondscommerce.co.uk
 * info@edmondscommerce.co.uk
 * +44 (0)844 357 0201
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * It is available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 *
 *
 * @category   EdmondsCommerce
 * @package    EdmondsCommerce_DataFlow
 * @copyright  Copyright (c) 2010 Edmonds Commerce (http://www.edmondscommerce.co.uk)
 * @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 -->

<config>
    <modules>
        <EdmondsCommerce_DataFlow>
                <depends>
                        <Mage_Catalog />
                        <Mage_Dataflow />
                  </depends>
                <version>0.1.0</version>
        </EdmondsCommerce_DataFlow>
    </modules>
       <admin>
        <fieldsets>
            <catalog_product_dataflow>
                <qty>
                    <inventory>1</inventory>
                    <to_number>1</to_number>
                    <product_type>
                        <simple />
                        <virtual />
                    </product_type>
                </qty>
                <min_qty>
                    <inventory>1</inventory>
                    <to_number>1</to_number>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                    </product_type>
                </min_qty>
                <is_qty_decimal>
                    <inventory>1</inventory>
                    <product_type>
                        <simple />
                        <virtual />
                    </product_type>
                </is_qty_decimal>
                <backorders>
                    <inventory>1</inventory>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                    </product_type>
                </backorders>
                <min_sale_qty>
                    <inventory>1</inventory>
                    <to_number>1</to_number>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                    </product_type>
                </min_sale_qty>
                <max_sale_qty>
                    <inventory>1</inventory>
                    <to_number>1</to_number>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                    </product_type>
                </max_sale_qty>
                <is_in_stock>
                    <inventory>1</inventory>
                    <inventory_other>1</inventory_other>
                    <product_type>
                        <simple />
                        <virtual />
                        <configurable />
                        <grouped />
                    </product_type>
                </is_in_stock>
                <notify_stock_qty>
                    <inventory>1</inventory>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                    </product_type>
                </notify_stock_qty>
                <manage_stock>
                    <inventory>1</inventory>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                        <configurable />
                        <grouped />
                    </product_type>
                </manage_stock>
                <!-- EdmondsCommerce added //-->
                <enable_qty_increments>
                    <inventory>1</inventory>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                        <configurable />
                        <grouped />
                    </product_type>
                </enable_qty_increments>
                <qty_increments>
                    <inventory>1</inventory>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                        <configurable />
                        <grouped />
                    </product_type>
                </qty_increments>
                <!-- EdmondsCommerce ends //-->
                <image><img>1</img></image>
                <small_image><img>1</img></small_image>
                <thumbnail><img>1</img></thumbnail>

                <store><external>1</external></store>
                <websites><external>1</external></websites>
                <sku><external>1</external></sku>
                <attribute_set><external>1</external><ignore>1</ignore></attribute_set>
                <type><external>1</external><ignore>1</ignore></type>
                <name><external>1</external><required>1</required></name>
                <description><external>1</external><required>1</required></description>
                <short_description><external>1</external><required>1</required></short_description>
                <weight><external>1</external><required>1</required></weight>
                <price><external>1</external><required>1</required></price>

                <tax_class_id><required>1</required></tax_class_id>
                <category_ids><system>1</system><ignore>1</ignore></category_ids>

                <entity_id><system>1</system><internal>1</internal><ignore>1</ignore></entity_id>
                <old_id><internal>1</internal></old_id>
                <tier_price><internal>1</internal></tier_price>
                <media_gallery><internal>1</internal></media_gallery>

                <entity_type_id><system>1</system></entity_type_id>
                <attribute_set_id><system>1</system><ignore>1</ignore></attribute_set_id>
                <type_id><system>1</system><ignore>1</ignore></type_id>
                <created_at><system>1</system></created_at>
                <updated_at><system>1</system></updated_at>
                <item_id><system>1</system></item_id>
                <product_id><system>1</system></product_id>
                <stock_id><system>1</system></stock_id>
                <required_options><system>1</system><ignore>1</ignore></required_options>
            </catalog_product_dataflow>
        </fieldsets>
    </admin>
</config>

```


If you look towards the middle you will see this bit:

```xml

            <!-- EdmondsCommerce added //-->
                <enable_qty_increments>
                    <inventory>1</inventory>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                        <configurable />
                        <grouped />
                    </product_type>
                </enable_qty_increments>
                <qty_increments>
                    <inventory>1</inventory>
                    <use_config>1</use_config>
                    <product_type>
                        <simple />
                        <virtual />
                        <configurable />
                        <grouped />
                    </product_type>
                </qty_increments>
                <!-- EdmondsCommerce ends //-->

```

If there are any other columns you need to enable then you will need to do something similar.
