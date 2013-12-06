---
layout: post
status: publish
published: true
title: Fix for Magento Admin Menus Disappearing in Opera
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 3908
wordpress_url: http://www.edmondscommerce.co.uk/?p=3908
date: 2013-02-01 18:08:17.000000000 +00:00
categories:
- magento
tags:
- magento
- menus
- css
- opera
---
Users of Opera might find that mousing down menus makes them disappear from underneath the cursor, making for a very frustrating experience.

From searching round the internet I understand the problem to be around the onmousevent on the li elements. So instead of using these events to show and hide menus we can just use CSS (as it should be) to show and hide the menus.

Methods to add the CSS include a custom user stylesheet (Right-click > Edit Site Preferences > Display tab), or the Stylish extension. The CSS to add is very simple:

```

#nav li:hover > ul {
  left:auto;
  z-index:999999;
}

```
