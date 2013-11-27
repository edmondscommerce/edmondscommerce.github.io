---
layout: post
status: publish
published: true
title: Magento Upgrade to 1.7, Fix for Sales Order Tab Contents in Left Sidebar
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3452
wordpress_url: http://www.edmondscommerce.co.uk/?p=3452
date: 2012-10-15 14:44:29.000000000 +01:00
categories:
- php
tags:
- edmondscommerce
---
If following an upgrade to Magento 1.7 you're having a problem that the Sales Order View tab contents are stuck in the sidebar (see below) you're likely ripping your hair out as to why this is happening
{% img  /assets/Sales-Order-View-Problem-502x600.png %}

In the page you'll find a line of Javascript:
<code>sales_order_view_tabsJsTabs = new varienTabs('sales_order_view_tabs', 'sales_order_view', 'sales_order_view_tabs_order_info', []);</code>

<h2>The problem</h2>

This is the javascript which renders the tabs on the page, moving the tab contents to the main content area once the page has loaded. The second parameter here is the destination element. The issue I was having was that the element with the id 'sales_order_view' wasn't in the HTML. This div is contained in app/design/adminhtml/default/default/template/sales/order/view/form.phtml, but this wasn't being loaded.

<h3>The solution</h3>

In my case this was a code/local overridden core class Mage_Sales_Model_Order. In Magento 1.7 the method canReorder() has been renamed to canReorderIgnoreSalable(). Renaming the overridden method fixed my problem
