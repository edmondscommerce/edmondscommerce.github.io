---
layout: post
status: publish
published: true
title: Failing to Create Foreign Keys (errno 150) + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1851
wordpress_url: http://www.edmondscommerce.co.uk/?p=1851
date: 2010-10-19 16:32:25.000000000 +01:00
categories:
- mysql
tags:
- mysql
- magento
- innodb
- foreign keys
- errno 150
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are struggling to get some foreign keys set up on your MySQL InnoDB database then perhaps this is your problem and a pretty simple solution.

If you are getting errno 150 then take a look at the data types for the two fields that you are trying to relate to each other.

I had issues in Magento creating foreign keys against the customer_entity and sales_flat_order tables (entity_id columns). Turns out the issue was that these columns were set to UNSIGNED on the Magento tables, yet my tables columns did not have this attribute.

Set your columns to UNSIGNED (and otherwise double check the datatypes are the same) and I bet it will all work for you.
