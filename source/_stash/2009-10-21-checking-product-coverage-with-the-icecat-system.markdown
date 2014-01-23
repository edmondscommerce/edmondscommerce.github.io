---
layout: post
status: publish
published: true
title: Checking Product Coverage with the ICEcat system.
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1207
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1207
date: 2009-10-21 09:37:57.000000000 +01:00
categories:
- icecat
tags:
- icecat
- product
- data
- coverage
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you want to check coverage against ICEcat, the best thing to do is to import their dump file available <a href="http://data.icecat.biz/prodid/prodid_d.txt.gz">here</a> into a MySQL database.

The file format is a bit unusual, but here is a nice command you can run. You need to have created a database in it with a table called prodid_d

```sql

CREATE TABLE IF NOT EXISTS `prodid_d` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_number` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `quality` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `ean` varchar(255) NOT NULL,
  `market_presence` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1

```

then in the command line (linux) run the follwing command:

```

mysqlimport --user=DBUSER --password=DBPASSWORD --columns=part_number,brand,quality,category,model,ean,market_presence --fields-terminated-by='\t\t\t' --replace  DBTABLE /ABSOLUTE/PATH/TO/prodid_d.txt

```
