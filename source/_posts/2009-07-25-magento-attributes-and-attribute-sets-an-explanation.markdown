---
layout: post
status: publish
published: true
title: Magento Attributes and Attribute Sets - An Explanation
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1116
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1116
date: 2009-07-25 10:37:58.000000000 +01:00
categories:
- magento
tags:
- magento
- attributes
- attribute sets
---
One of the really cool and powerful features of Magento compared to other more traditional ecommerce platforms is the way that product information is handled. On a traditional system you will likely have one or a small number of tables to store product information. For each element of product information there is a column on these tables. This might be things like price, weight, model code etc etc.

But lets imagine that you sell T shirts. So you decide that you want to add a new column to your system to store the following bits of info:

size
material
male/female

Ok no problem, you add these columns to your table, modify your administration system and front end to display this extra info. Easy enough. You also decide to modify your search page so that people can search by T shirt size, material or mens/womens so your search is much easier to use.

However, lets say you find a new supplier for footwear. You want to add all these new products to your system but you also want to be able to store the extra information related to shoes, for example:

UK Size
European Size
Upper
Sole

Of course you can go ahead and add a bunch more columns to your table and store this info. However, now you have the issue that you need to edit your front end to only display the shoe related info for shoes and only the T shirt related info for T shirts. You can probably figure out a way to handle this, but I'm sure you can start to see the problem. This approach doesn't scale well. Lets say instead of 2 main product types you have 200 or even 2000. 

In the end what ends up happening is that you only store basic specific information about a product and then all the finer details go into the product description. Thats fine, but its not great. Also you have to lose your nice new search functionality.

Magento deals with this in an entirely different way. Instead of having the traditional spreadsheet like database table relationships (1 row for each product), Magento does things differently and stores 1 item of information per row (over simplified but enough to illustrate my point). This means that there is no limit to how many elements of information can be stored for each product.

Magento Groups these attributes (as it calls them) into attribute sets. An attribute set is simply enough a collection of attributes. There is a default attribute set which you would generally make a copy of and then customise for each kind of product you want to have custom attributes for. So continuing our T shirts and shoes example, you would make a new attribute set called T shirts, based on the Default set, and also one for shoes.

The T shirts attribute set will contain all the standard attributes (such as price, title etc) inherited from the default set, but we can also add in our custom attributes. Same goes for the shoes.

Then when we want to add a new product (lets say a T shirt) we select the T shirts attribute set so that we then have fields to enter information for our custom T shirt attributes.

