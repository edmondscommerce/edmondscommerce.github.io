---
layout: post
status: publish
published: true
title: Magento Front End Flat Catalogue
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 300
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=300
date: 2009-04-08 09:14:15.000000000 +01:00
categories:
- magento
tags:
- magento 1.3
- front end flat catalogue
- magento performance
---
With the release of version 1.3 of Magento, a new feature has been added called Front End Flat Catalogue.

In a nutshell this feature creates a single database table with all of the products and their various attributes so that front end queries for information can pulll all product information from every product from a single table rather than having to query lots of EAV tables.

For sites that have a large number of products (Varien say over 1000 apparently) this can mean a huge performance gain - up to 40%. This is great news for me as up till now I have been reluctant to recommend Magento for any store with a very large catalogue due to concerns on the EAV table structures abilitity to deal with very large amounts of data and maintain performance.

I do wonder if this flat table structure renders the EAV system somewhat redundant, in fact maybe version 2 or 3 of Magento will abandon it altogether - we will see.

For now though it means that I can start to recommend Magento to my clients who run large catalogues. As these are the majority of my major clients this is great news for me and also great news for my clients who can now start to take advantage of what is undoubtedly the most exciting open source ecommerce package currently available. 
