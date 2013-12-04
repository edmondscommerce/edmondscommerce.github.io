---
layout: post
status: publish
published: true
title: Getting a Billing Address from the Magento Orders Table
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3415
wordpress_url: http://www.edmondscommerce.co.uk/?p=3415
date: 2012-09-13 10:40:28.000000000 +01:00
categories:
- magento
tags:
- mysql
- development
- problem
- magento
- solution
- tip
---
I recently had to generate a report listing the details of all orders from a magento store that matched certain parameters. 

There was a requirement that the billing address should be included in this, and I wanted to do this all in SQL if possible.

The biggest problem was formatting the address as there is a value in the address table called suffix, which contains the County information, but is not a required value.

As I was adding in line breaks to the select, this meant for all of the orders that did not have the value, then there would be a blank line using a standard CONCAT statement.

What I found was that it is possible to add an IF statement to the CONCAT query, which gives the required result.

This is done like this

```sql

SELECT
    -- Other Values that are needed --
    CONCAT(
        billing.firstname, &quot; &quot;, billing.lastname, &quot;\n&quot;, 
        billing.street, &quot;\n&quot;, 
        billing.city, 
            if(billing.suffix IS NOT NULL, 
                CONCAT( &quot;\n&quot;, billing.suffix),
                ''
              ), &quot;\n&quot;, 
        billing.postcode) AS &quot;Billing Address&quot;
FROM sales_flat_order AS sfo
JOIN sales_flat_order_address AS billing
    ON billing.parent_id = sfo.entity_id
    AND billing.address_type = 'billing'
-- add your WHERE conditions --

```
