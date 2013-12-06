---
layout: post
status: publish
published: true
title: Very High Speed Batch Update Multiple Rows of a Table in Single Query
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2678
wordpress_url: http://www.edmondscommerce.co.uk/?p=2678
date: 2011-10-13 14:00:26.000000000 +01:00
categories:
- mysql
tags:
- mysql
- performance
- php
- function
- table
- bulk
- ecommerce
- update
- tip
- rows
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to update a large number of rows on a single table then your first reaction may be to write a loop that updates one row at a time.

Of course if the table is large then this can result in a very large number of SQL queries.

Taking a bit of inspiration from <a href="http://www.kavoir.com/2009/05/mysql-update-multiple-rows-with-one-single-query.html">this post</a> I have put together this simple PHP function that will allow you to update as many rows as you want.

The trade off is basically memory usage as you build up a big array of row update information preparing for the batch. For this reason you may want to tune the number of rows you update per query.

```php

function bulkUpdateSingleColumn($table, $id_column, $update_column, array &$idstovals){
        $sql = "update $table set $update_column = CASE $id_column ";
        foreach($idstovals as $id=>$val){
            $sql .= " WHEN '$id' THEN '$val' \n";
        }
        $sql .= " END 
        WHERE $id_column in (" . implode(',', array_keys($idstovals)) . ")";
//debugging info
        echo '<small>'.$sql.'</small>';
        $idstovals=array();        
        db_query($sql);       
        done();        
    }

```
