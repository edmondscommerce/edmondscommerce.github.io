---
layout: post
status: publish
published: true
title: Get all product attributes for a magento object using SQL
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3270
wordpress_url: http://www.edmondscommerce.co.uk/?p=3270
date: 2012-08-15 14:17:17.000000000 +01:00
categories:
- magento
tags:
- mysql
- development
- php
- magento
- solution
- helpful tips
---
Sometimes you may want to quickly compare all of the attributes that object (category / product) has in magento. The EAV structure of the database makes this difficult to do this simply, so this is a query that will do it for you

```sql

SELECT * FROM (
    SELECT 
        ce.sku,
        ea.attribute_id,
        ea.attribute_code,
        CASE ea.backend_type
           WHEN 'varchar' THEN ce_varchar.value
           WHEN 'int' THEN ce_int.value
           WHEN 'text' THEN ce_text.value
           WHEN 'decimal' THEN ce_decimal.value
           WHEN 'datetime' THEN ce_datetime.value
           ELSE ea.backend_type
        END AS value,
        ea.is_required AS required
    FROM catalog_product_entity AS ce
    LEFT JOIN eav_attribute AS ea 
        ON ce.entity_type_id = ea.entity_type_id
    LEFT JOIN catalog_product_entity_varchar AS ce_varchar 
        ON ce.entity_id = ce_varchar.entity_id 
        AND ea.attribute_id = ce_varchar.attribute_id 
        AND ea.backend_type = 'varchar'
    LEFT JOIN catalog_product_entity_int AS ce_int 
        ON ce.entity_id = ce_int.entity_id 
        AND ea.attribute_id = ce_int.attribute_id 
        AND ea.backend_type = 'int'
    LEFT JOIN catalog_product_entity_text AS ce_text 
        ON ce.entity_id = ce_text.entity_id 
        AND ea.attribute_id = ce_text.attribute_id 
        AND ea.backend_type = 'text'
    LEFT JOIN catalog_product_entity_decimal AS ce_decimal 
        ON ce.entity_id = ce_decimal.entity_id 
        AND ea.attribute_id = ce_decimal.attribute_id 
        AND ea.backend_type = 'decimal'
    LEFT JOIN catalog_product_entity_datetime AS ce_datetime 
        ON ce.entity_id = ce_datetime.entity_id 
        AND ea.attribute_id = ce_datetime.attribute_id 
        AND ea.backend_type = 'datetime'
    WHERE ce.sku = YOUR_SKU
  ) AS tab
  WHERE tab.value != &quot;&quot;;

```

This version of the query will only return values that are not blank, but if you only run the sub query it will give you every value. 
Replace catalog_product* for catalog_category to get the values for a category. You will also have to use a different selector than SKU.
