---
layout: post
status: publish
published: true
title: Magento 2 - Key Points for Developers!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2900
wordpress_url: http://www.edmondscommerce.co.uk/?p=2900
date: 2012-01-23 14:41:44.000000000 +00:00
categories:
- magento
tags:
- web developer
- php
- magento
- developer
- zend
- version
- two
- '2'
- magento 2
- php 5.3
- '5.3'
---
The first development release of Magento 2 has a few areas worthy of note for developers of the coming changes to Magento.

Magento 2 now requires PHP 5.3
Zend is still version 1.11.1.
Magento 2 now implements templates on a per modules basis. So now all the different bits of the theme are separated into the modules it belongs to. This means that any existing version 1 theme cannot be dropped into version 2.
Themes in Magento 2 have the concept of variations of the same theme. So a theme can have different CSS and images but use the same templates, this can be configured per store per user agent in the admin. This is useful if you have different seasonable themes that are the same as each other but with a few different images and colours. To achieve the same in Magento 1 you would have to use packages and Magento's ability to cascade up, this is not longer necessary.

This development release of Magento has a major focus on updating the theme and template system to be more ridged unlike Magento version 1 where the template files could be basically any where within a theme.
