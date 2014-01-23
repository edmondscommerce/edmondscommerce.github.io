---
layout: post
status: publish
published: true
title: 'osCommerce Contribution Released: Server Migration Synchronisation'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 51
wordpress_url: http://www.edmondscommerce.co.uk/blog/oscommerce/oscommerce-contribution-released-server-migration-synchronisation/
date: 2008-05-21 13:29:57.000000000 +01:00
categories:
- oscommerce
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
<a href="http://addons.oscommerce.com/info/5958">Server Migration Orders / Customers Synchronisation</a>

This contribution is for people who have moved or are moving server. When this happens you have to update your DNS records to point your domain name at your new server. However it takes a little bit of time for this change to fully propogate through the internet meaning that for a period you will take orders at both servers.

Once your DNS has fully propogated you can use this system to generate a mysql dump of all of the orders/customers on your old site that need to be moved across to the new server.
