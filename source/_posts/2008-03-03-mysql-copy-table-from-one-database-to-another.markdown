---
layout: post
status: publish
published: true
title: MySQL Copy Table from One Database to Another
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 26
wordpress_url: http://www.edmondscommerce.co.uk/blog/mysql/mysql-copy-table-from-one-database-to-another/
date: 2008-03-03 13:51:37.000000000 +00:00
categories:
- mysql
- web development
- programming
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Sometime in MySQL you want to copy an entire table from one database to a separate database. One example of when you would want to do this is if you are making a backup of a table before you apply some kind of processing to that table. There is nothing worse than ruining a database table and losing valuable information. To make an instant backup is so easy that there really is no excuse not to make backups at important or risky stages.

Here is how to do it:

```mysql

DROP TABLE IF EXISTS `backup_db.backup_table`;
CREATE TABLE `backup_db.backup_table` SELECT * FROM `live_db.live_table`;

```

This will delete your existing backup table completely, then will remake it copying all structural information and content from the live_table in the live_db.

