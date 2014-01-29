---
layout: post
status: publish
published: true
title: Magento "Products per Page on Grid Allowed Values" Configuration Not Working
  + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2608
wordpress_url: http://www.edmondscommerce.co.uk/?p=2608
date: 2011-09-01 13:53:31.000000000 +01:00
categories:
- magento
tags:
- problem
- magento
- xml
- product
- solution
- toolbar
- list
- layout
- pager
- count
- dropdown
---
If you are getting a <i>little bit frustrated</i> trying to figure out why the admin configuration for the number of products to display on a page and the options in the products per page drop down are not working then this is quite possibly your soluiton.

The template file in question is in catalog/product/list/toolbar.phtml

You will see it refererences the block Mage_Catalog_Block_Product_List_Toolbar

So far so good, it all looks like it should be working but it just isn't.

The issue can be that in your theme's layout XML file, some values are being set for this with some XML that looks like this:

```xml

<action method="setDefaultListPerPage"><limit>10</limit></action> 
<action method="setDefaultGridPerPage"><limit>8</limit></action> 
<action method="addPagerLimit"><mode>list</mode><limit>10</limit></action> 
<action method="addPagerLimit"><mode>list</mode><limit>20</limit></action> 
<action method="addPagerLimit"><mode>list</mode><limit>30</limit></action> 

```

If that XML is there, then these actions are being called against your block object with these parameters, effectively overwriting your admin values.

To get the admin values to be respected, you need to comment out or totally remove this XML from your layout, clear your cache and you are in business.
