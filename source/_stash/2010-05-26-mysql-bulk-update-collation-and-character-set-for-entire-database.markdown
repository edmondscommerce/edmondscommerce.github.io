---
layout: post
status: publish
published: true
title: MySQL Bulk Update Collation and Character Set for Entire Database
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1675
wordpress_url: http://www.edmondscommerce.co.uk/?p=1675
date: 2010-05-26 17:06:10.000000000 +01:00
categories:
- mysql
tags:
- mysql
- php
- bulk
- collation
- character set
- change
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to change the character set and collation for all columns and tables on an entire database then check out this little PHP script.

It's currently Zend Framework based, though only for the database adapter - you could easily modify this to suit your own database connection.

```php

<?php
/* collationChange
 * Edmonds Commerce
 * www.edmondscommerce.co.uk
 * info@edmondscommerce.co.uk
 * 0844 357 0201
 *
 * Description:
 *
 * Bulk Change the Collation and Character Set for an Entire Database
 *
 * Inspiration Came from Here:
 * http://serverfault.com/questions/65043/alter-charset-and-collation-in-all-columns-in-all-tables-in-mysql
 * 
 */

//get Db connection etc
require('../_top.php');
$db = Zend_Registry::get('dbAdapter');

$dbName='SET_THE_DB_NAME';
$character_set = 'utf8';
$collation = 'utf8_general_ci';

$stmt = $db->query("SELECT distinct CONCAT( 'alter table ', TABLE_SCHEMA, '.', TABLE_NAME, '  CONVERT TO CHARACTER SET $character_set COLLATE $collation;' ) as query, TABLE_NAME as t FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '$dbName';");
while($r=$stmt->fetch()){
    $db->query($r['query']);
    echo "<h3>Done {$r['t']}</h3>";
}

```
