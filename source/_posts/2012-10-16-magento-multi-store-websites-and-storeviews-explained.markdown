---
layout: post
status: publish
published: true
title: Magento Multi Store, Websites and Storeviews Explained
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3458
wordpress_url: http://www.edmondscommerce.co.uk/?p=3458
date: 2012-10-16 13:56:19.000000000 +01:00
categories:
- magento
tags:
- magento
- multistore
- view
- translation
- website
- power
- version
- multi
- store
- domain
- scope
---
One of the most exciting features of Magento for many merchants is the ability to run multiple front end websites with a single administration area. For those of you who have managed multiple separate installations of a cart system to power many websites, perhaps selling the same products, then this on its own can make a huge difference in terms of ease of management.

Magento has had multi store functionality designed in from the ground up. This results in a multistore implementation that feels solid and intuitive and also very powerful. This is in contrast to other carts' multi store systems which can often feel like a bit of a bolt on after thought that isn't as clearly embedded into the system.

<h2>Magento Scopes</h2>
Magento has a hierarchical system of stores with 4 levels. 

<h3>Global Scope</h3>
The top of the hierarchy is the global scope. This scope defines the default values for the various attributes that products and categories contain. You can not see the global scope as a store front but in the admin side the global scope is the one you work in by default and is likely to be where you spend most of your admin time.

<h3>Website Scope</h3>
Magento has the concept of websites. You can think of a website as a domain name (though this is perhaps an over simplification). A website can contain one or more stores.

<h3>Store Scope</h3>
A store is the item that contains products and categories. A category structure is built from a "root" category. The root category is not displayed on the front end, its children categories become the top level categories for the store when viewed in the front end. A store can have it's own root category and structure or can share the same one used by other stores.

<h3>Store View</h3>
Every store contains at least one store view. You can generally think of store views as translations of a store (though this is not the only use case). The category structure will be the same for the various store views and this scope is generally used to store alternative values for textual content such as product names, descriptions etc.

<h2>Editing Values on a Per Scope Basis</h2>
When you are editing products, categories or configuration in your Magento admin you will have a drop down in the top left of the screen that determines which scope you are currently working in. As a best practice always try to be as close to the global scope as possible when making your edits, only descending into the lower scopes as required.

<h2>Possibilites</h2>
The possibilities of these various scopes are almost limitless, you can manage a large and diverse range of store fronts that may or may not be clearly related to each other from the customers point of view from a single Magento administration. Like many things in Magento, this powerful system can become complex and we really strongly advise that you plan out your store structure before you start actually adding things so that you ensure you are building a nice logical system that is going to scale up as you grow.

