---
layout: post
status: publish
published: true
title: Update Magento category attribute sort order from the database
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3089
wordpress_url: http://www.edmondscommerce.co.uk/?p=3089
date: 2012-04-18 17:48:13.000000000 +01:00
categories:
- magento
tags:
- mysql
- development
- magento
- attributes
- attribute sets
- tips
---
If you have written your own modules, and need to rearrange the order that your attributes or displayed in, or change anything else, you can use the following SQL statements to fix their order.

First you need to get the attribute group that the attributes are under. This can be done by running the following
```mysql

SELECT attribute_group_id,  attribute_group_name FROM eav_attribute_group

```

This will give all of the different tabs for categories as well as the products. Find the group ID that you need and then run the following command to see all of the attributes associated with it
```mysql

SELECT eea.*, ea.attribute_code FROM eav_entity_attribute AS eea JOIN eav_attribute AS ea ON eea.attribute_id = ea.attribute_id WHERE eea.attribute_group_id = 4

```

Here we are using the group_id of 4 which gives the following result
{% img  /assets/screenshot2-600x234.png %}

The sort_order is the attribute that you need to change to move the attributes around the page. If the sort order is sequential then a simple trick to add some padding is to run the following command
```mysql

UPDATE eav_entity_attribute SET sort_order = (sort_order*10) WHERE attribute_group_id = 4;

```

Which will multiple each sort order by 10 allowing you to move the attributes around easier.
