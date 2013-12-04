---
layout: post
status: publish
published: true
title: Magento Rounding Errors (1.6.0+)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3176
wordpress_url: http://www.edmondscommerce.co.uk/?p=3176
date: 2012-07-17 11:02:21.000000000 +01:00
categories:
- magento
tags:
- php
- problem
- magento
- ecommerce
- rounding
---
The latest version of Magento has a fairly major issue that mostly affects UK and EU businesses, in the way it calculates taxes.

One of the most obvious situations is if you sell something worth £24.99 (inc. tax) and enter that as the price in Magento.  The thread on the Magento forum is <a href="http://www.magentocommerce.com/boards/viewthread/247201/">here</a>.

On the front end (if you have left the standard price templates alone) you will in 1.6.2+ see a price of £24.98.

This is because Magento first takes off the tax, then adds it back on, unfortunately a rounding error creeps in at one or the other side of the process.

Magento claims this is fixed in 1.7.0.1 but from reports we have seen this is not the case.  There are two current fixes but they both have issues.

The first (listed <a href="http://www.magentocommerce.com/boards/viewreply/353791/">here</a>) is to override the store rounding system and have Magento work to 4 decimal places instead of 2.  That's fine and works but if you have a payment gateway that gets fed the line items (such as Paypal Express Checkout for instance), the total does not match the line items (probably because it is passed a 4dp number and it doesn't match the totals of the 2dp items).

Another option (as mentioned <a href="http://www.magentocommerce.com/boards/viewreply/361474/">here</a>) is to assume no rounding where it is not specified rather than assuming rounding.  This won't cause problems with gateways but then you do need to fiddle with your templates to make sure your prices are displayed with tax.

As mentioned, we haven't actually seen a solution that works across the board and is right with stats, payment gateways, frontend and backend.  It's a major bug and hopefully the next release of Magento will fix this.

This appears to be most prevalent when using the "Prices include tax in backend" setting as the tax calculation only gets done once if you enter pre-tax prices and have the tax only added on.  That isn't to say that it will always calculate the tax correctly that way round either, just that this particular rounding issue is not as visible.

Also, the fixes listed on that thread involve modifying core files - <strong>don't do this!</strong> copy the files to /app/code/local/Mage from /app/code/core/Mage and modify them in there.
