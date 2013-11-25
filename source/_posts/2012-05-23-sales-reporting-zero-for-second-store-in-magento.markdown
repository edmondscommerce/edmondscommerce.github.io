---
layout: post
status: publish
published: true
title: Sales Reporting Zero for Second Store in Magento
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3104
wordpress_url: http://www.edmondscommerce.co.uk/?p=3104
date: 2012-05-23 12:04:48.000000000 +01:00
categories:
- magento
tags:
- problem
- magento
- fix
- tip
- sales
- rate
- conversion
- orders
---
<a href="{% img  ({{ site.url }}/assets/base_rate.png %}"><img src="{% img  ({{ site.url }}/assets/base_rate.png %}" alt="" title="base_rate" width="415" height="197" class="aligncenter size-full wp-image-3105" /></a>
If you are running multi site Magento with different currencies and are finding that the sales reports on the stores that don't use the Magento default currency all show zero this probably means the currency conversion rates have not been configured. Due to the way Magento orders work existing orders will not have there conversion rate updated. There is no way to do this from the admin, the only real option is to update the orders directly in the database.
