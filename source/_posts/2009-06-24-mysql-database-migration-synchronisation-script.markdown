---
layout: post
status: publish
published: true
title: Mysql Database Migration / Synchronisation Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 814
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=814
date: 2009-06-24 15:45:15.000000000 +01:00
categories:
- mysql
tags:
- mysql
- php
- migration
- synchronisation
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
This is a nice little script I just knocked together that helps to synchronise databases when the table structures might not be exactly the same (for example different versions of the same system).

You would need to edit the top section to put the correct DB credentials etc.

This is definitely <b>not to be used on a live DB</b>, purely for aiding development and migration.

```php

<?php
/** Database Synchronisation / Migration Tool
 *
 * For synching up an old and a new DB schema.
 *
 * @author EdmondsCommerce.co.uk
 *
 */

//do you want the system to empty the new table before inserting data from the old table?
$truncate=true;

/**
 * DB Server Credentials - Needs to have full access to both databases
 */
$dbHost='localhost';
$dbUser='root';
$dbPass='password';

/** Tables to Synch
 */
$tablesToSynch = array(
    'categories',
    'categories_description',
    'products',
    'products_description',
    'products_to_categories',
    'manufacturers',
);

$dbOld = 'dbold';

$dbNew = 'dbnew';


/*********** CODE BELOW HERE - NO NEED TO EDIT UNLESS YOU WANT TO ***********/
$_conn = mysql_connect($dbHost,$dbUser,$dbPass) or die('DB Connection Failed');

$dbOldTables= fetch_tables($dbOld);

$dbNewTables = fetch_tables($dbNew);


foreach($tablesToSynch as $table){

    echo '<h3>Doing '.$table.'</h3>';
    //check for common tables
    if(in_array($table, $dbOldTables) && in_array($table, $dbNewTables)){
        //now get column data
        $dbOldTableCols = fetch_columns($dbOld,$table);

        $dbNewTableCols = fetch_columns($dbNew,$table);

        //now for the column comparison
        $cols=array_intersect($dbOldTableCols, $dbNewTableCols);

        //now emptying the new DB if set to do so
        if($truncate){
            db_query("TRUNCATE $dbNew.$table");
        }

        //copy old table to new DB so we can copy columns
        $tempTable=copy_table($dbOld, $dbNew, $table);

        //now build SQL and run
        $sql = "insert into $dbNew.$table (" . implode(', ',$cols) . ") select " . implode(', ',$cols) . " from $dbNew.$tempTable";
        db_query($sql);

        //now drop temp table
        db_query("DROP TABLE $dbNew.$tempTable");
    }
    
}

/****** FUNCTIONS ********/

function db_query($query){
$output = mysql_query($query) or die('
<h1 style="color: red">Uh Oh......MySQL Error:</h1>
<h3>Query:</h3>
<pre>' . htmlentities($query) . '</pre>
<h3>MySQL Error:</h3>
' . mysql_error() . '
<hr /> <hr />');	return $output;
}


function fetch_tables($dbname){
    $query=db_query("show tables from $dbname");
    while($r=mysql_fetch_assoc($query)){
        $return[]=$r["Tables_in_$dbname"];
    }
    return $return;
}

function fetch_columns($dbname, $table){
    $query = db_query("SHOW COLUMNS from $dbname.$table");
    while($r= mysql_fetch_assoc($query)){
        $return[]=$r['Field'];
    }
    return $return;
}

function copy_table($fromDb, $toDb, $table){
    db_query("DROP TABLE IF EXISTS $toDb.temp_$table");
	db_query("CREATE TABLE $toDb.temp_$table LIKE $fromDb.$table");
	db_query("ALTER TABLE $toDb.temp_$table DISABLE KEYS");
	db_query("INSERT INTO $toDb.temp_$table SELECT * FROM $fromDb.$table");
	db_query("ALTER TABLE $toDb.temp_$table ENABLE KEYS");
    return "temp_$table";
}

```
