---
layout: post
status: publish
published: true
title: Magento Database Repair Tool
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1154
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1154
date: 2009-08-17 08:30:07.000000000 +01:00
categories:
- magento
tags:
- magento
- database
- repair
- tool
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Varien have just released a new tool to help repair Magento databases. The system works by taking a reference database (a clean installation of the same Magento version your store is running) and comparing this to your live store DB.

It then goes through and repairs your store DB, fixing things like missing foreign keys etc.

I haven't personally seen a requirement for this as yet, but if they have gone to the effort of releasing a tool I imagine it is because there is a requirement for this kind of tool. Definitely something to bear in mind if you ever do need to repair an Existing Magento database.

Read the full wiki post here:
<a href="http://www.magentocommerce.com/wiki/doc/db-repair-tool">http://www.magentocommerce.com/wiki/doc/db-repair-tool</a>
