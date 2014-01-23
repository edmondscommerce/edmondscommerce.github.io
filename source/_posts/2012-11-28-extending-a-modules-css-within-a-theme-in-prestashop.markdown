---
layout: post
status: publish
published: true
title: Extending a Modules CSS within a Theme in PrestaShop
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 3716
wordpress_url: http://www.edmondscommerce.co.uk/?p=3716
date: 2012-11-28 17:26:39.000000000 +00:00
categories:
- prestashop
tags:
- performance
- development
- Cascading Style Sheets
- theme
- module
- prestashop
- implement themes
- css
---
PrestaShop has a really nice structure for handling all the CSS that will appear in a site. It starts by splitting the CSS so that the CSS is split up per modules. There is a global CSS sheet but this should only be used for things that genuinely appear on all pages.

Extending the CSS of a module in PrestaShop is easy. All you need to do is create a CSS file that matches the naming convention of the module you are looking to extend.

For example if you wanted to change the CSS of the “Wishlist block” module (a.k.a. blockwishlist) in your theme, you would create the file themes/mytheme/css/modules/blockwishlist/blockwishlist.css. This file will then be included on every page that the CSS from the blockwishlist module appears on.

This system is good because it minimises the amount of CSS the browser has to load and also splits the concern of CSS into separate files making it much easier to manage. It also makes adding to a modules CSS with in a theme much easier.

One problem with this method of handling CSS is that by default a PrestaShop site may want the browser to download ten or more individual CSS files which is quite a overhead. Fortunately since PrestaShop 1.4 it has supported CCS merging (referred to as CCC in the admin) which causes the CSS for a page to be merged into a single file on the server to prevent the client having to download tens of CSS files.
