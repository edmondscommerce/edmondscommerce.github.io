---
layout: post
status: publish
published: true
title: Build Table from File PHP Function
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1179
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1179
date: 2009-09-03 12:27:39.000000000 +01:00
categories:
- php
tags:
- php
- table
- file
- import
- csv
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
This little PHP function will allow you to import a csv or tab etc delimited text file into a database table. Handy if you need it :)

```php

function build_table_from_file($tablename, $filepath, $delim="\t") {
    db_query("DROP TABLE IF EXISTS $tablename");
    $fp=fopen($filepath, 'r');
    $headers=false;
    while($r=(($delim=='csv')?fgetcsv($fp):fgets($fp))) {
        if($delim!='csv'){
            $r=explode($delim, $r);
        }
        if(!$headers) {
            foreach($r as $h){
                $headers[]=trim($h);
            }
            $sql = "CREATE TABLE $tablename
                         (
                            `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,";
            foreach($headers as $h) {
                $sqls[]=" `" . db_in($h) . "` TEXT NOT NULL ";
            }
            $sql .= implode(', ', $sqls) . "
                        ) ENGINE = MYISAM ";
            db_query($sql);
            continue;
        }
        $sql = "insert into $tablename set ";
        $sqls=array();
        foreach($headers as $k=>$h) {
            $sqls[] = "`$h` = '" . db_in($r[$k]) . "'";
        }
        $sql .= implode(', ', $sqls);
        db_query($sql);
        pbar();
    }
}

```
