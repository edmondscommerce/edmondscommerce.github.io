---
layout: post
status: publish
published: true
title: PHP MySQL Dump Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 98
wordpress_url: http://www.edmondscommerce.co.uk/blog/mysql/php-mysql-dump-script/
date: 2009-01-19 16:28:57.000000000 +00:00
categories:
- mysql
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Don't get me wrong, I love phpMyAdmin and use it every day. However sometimes on client servers the only access to the database is via phpMyAdmin and it hasn't been set up properly. One really irritating example is when trying to dump a database so that it can be installed on my local development server. Do the export etc etc and then phpMyAdmin gives you the download, but no - its an empty file...

After messing around for 10 minutes you realise that no matter what you do, you aint getting your DB dump this way. 

In steps <a href="http://www.mt-soft.com.ar/wordpress/wp-content/uploads/2007/07/mysqldump.zip" rel="nofollow">this script</a>, as mentioned <a href="http://www.mt-soft.com.ar/2007/12/21/php-script-mysqldump/" rel="nofollow">here</a>.

Just in case that link dies - here is the body of the script - with all credit and thanks to the original author:

```php

<?php

set_time_limit(0);

/*---------------------------------------------------+

| mysqldump.php

+----------------------------------------------------+

| Copyright 2006 Huang Kai

| hkai@atutility.com

| http://atutility.com/

+----------------------------------------------------+

| Released under the terms & conditions of v2 of the

| GNU General Public License. For details refer to

| the included gpl.txt file or visit http://gnu.org

+----------------------------------------------------*/

/*

change log:

2006-10-16 Huang Kai

---------------------------------

initial release



2006-10-18 Huang Kai

---------------------------------

fixed bugs with delimiter

add paramter header to add field name as CSV file header.



2006-11-11 Huang Kia

Tested with IE and fixed the <button> to <input>

*/

$mysqldump_version="1.02";



$print_form=1;

$output_messages=array();





//test mysql connection

if( isset($_REQUEST['action']) )

{

	$mysql_host=$_REQUEST['mysql_host'];

	$mysql_database=$_REQUEST['mysql_database'];

	$mysql_username=$_REQUEST['mysql_username'];

	$mysql_password=$_REQUEST['mysql_password'];



	if( 'Test Connection' == $_REQUEST['action'])

	{

		_mysql_test($mysql_host,$mysql_database, $mysql_username, $mysql_password);

	}

	else if( 'Export' == $_REQUEST['action'])

	{

		_mysql_test($mysql_host,$mysql_database, $mysql_username, $mysql_password);

		if( 'SQL' == $_REQUEST['output_format'] )

		{

			$print_form=0;



			//ob_start("ob_gzhandler");

			header('Content-type: text/plain');

			header('Content-Disposition: attachment; filename="'.$mysql_host."_".$mysql_database."_".date('YmdHis').'.sql"');

			echo "/*mysqldump.php version $mysqldump_version */\n";

			_mysqldump($mysql_database);



			//header("Content-Length: ".ob_get_length());



			//ob_end_flush();

		}

		else if( 'CSV' == $_REQUEST['output_format'] && isset($_REQUEST['mysql_table']))

		{

			$print_form=0;



			ob_start("ob_gzhandler");



			header('Content-type: text/comma-separated-values');

			header('Content-Disposition: attachment; filename="'.$mysql_host."_".$mysql_database."_".$mysql_table."_".date('YmdHis').'.csv"');

			//header('Content-type: text/plain');

			_mysqldump_csv($_REQUEST['mysql_table']);

			header("Content-Length: ".ob_get_length());

			ob_end_flush();

		}

	}



}



function _mysqldump_csv($table)

{

	$delimiter= ",";

	if( isset($_REQUEST['csv_delimiter']))

		$delimiter= $_REQUEST['csv_delimiter'];



	if( 'Tab' == $delimiter)

		$delimiter="\t";





	$sql="select * from `$table`;";

	$result=mysql_query($sql);

	if( $result)

	{

		$num_rows= mysql_num_rows($result);

		$num_fields= mysql_num_fields($result);



		$i=0;

		while( $i < $num_fields)

		{

			$meta= mysql_fetch_field($result, $i);

			echo($meta->name);

			if( $i < $num_fields-1)

				echo "$delimiter";

			$i++;

		}

		echo "\n";



		if( $num_rows > 0)

		{

			while( $row= mysql_fetch_row($result))

			{

				for( $i=0; $i < $num_fields; $i++)

				{

					echo mysql_real_escape_string($row[$i]);

					if( $i < $num_fields-1)

							echo "$delimiter";

				}

				echo "\n";

			}



		}

	}

	mysql_free_result($result);



}





function _mysqldump($mysql_database)

{

	$sql="show tables;";

	$result= mysql_query($sql);

	if( $result)

	{

		while( $row= mysql_fetch_row($result))

		{

			_mysqldump_table_structure($row[0]);



			if( isset($_REQUEST['sql_table_data']))

			{

				_mysqldump_table_data($row[0]);

			}

		}

	}

	else

	{

		echo "/* no tables in $mysql_database */\n";

	}

	mysql_free_result($result);

}



function _mysqldump_table_structure($table)

{

	echo "/* Table structure for table `$table` */\n";

	if( isset($_REQUEST['sql_drop_table']))

	{

		echo "DROP TABLE IF EXISTS `$table`;\n\n";

	}

	if( isset($_REQUEST['sql_create_table']))

	{



		$sql="show create table `$table`; ";

		$result=mysql_query($sql);

		if( $result)

		{

			if($row= mysql_fetch_assoc($result))

			{

				echo $row['Create Table'].";\n\n";

			}

		}

		mysql_free_result($result);

	}

}



function _mysqldump_table_data($table)

{



	$sql="select * from `$table`;";

	$result=mysql_query($sql);

	if( $result)

	{

		$num_rows= mysql_num_rows($result);

		$num_fields= mysql_num_fields($result);



		if( $num_rows > 0)

		{

			echo "/* dumping data for table `$table` */\n";



			$field_type=array();

			$i=0;

			while( $i < $num_fields)

			{

				$meta= mysql_fetch_field($result, $i);

				array_push($field_type, $meta->type);

				$i++;

			}



			//print_r( $field_type);

			echo "insert into `$table` values\n";

			$index=0;

			while( $row= mysql_fetch_row($result))

			{

				echo "(";

				for( $i=0; $i < $num_fields; $i++)

				{

					if( is_null( $row[$i]))

						echo "null";

					else

					{

						switch( $field_type[$i])

						{

							case 'int':

								echo $row[$i];

								break;

							case 'string':

							case 'blob' :

							default:

								echo "'".mysql_real_escape_string($row[$i])."'";



						}

					}

					if( $i < $num_fields-1)

						echo ",";

				}

				echo ")";



				if( $index < $num_rows-1)

					echo ",";

				else

					echo ";";

				echo "\n";



				$index++;

			}

		}

	}

	mysql_free_result($result);

	echo "\n";

}



function _mysql_test($mysql_host,$mysql_database, $mysql_username, $mysql_password)

{

	global $output_messages;

	$link = mysql_connect($mysql_host, $mysql_username, $mysql_password);

	if (!$link)

	{

	   array_push($output_messages, 'Could not connect: ' . mysql_error());

	}

	else

	{

		array_push ($output_messages,"Connected with MySQL server:$mysql_username@$mysql_host successfully");



		$db_selected = mysql_select_db($mysql_database, $link);

		if (!$db_selected)

		{

			array_push ($output_messages,'Can\'t use $mysql_database : ' . mysql_error());

		}

		else

			array_push ($output_messages,"Connected with MySQL database:$mysql_database successfully");

	}



}



if( $print_form >0 )

{

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<html>

<head>

<title>mysqldump.php version <?php echo $mysqldump_version; ?></title>

</head>



<body>

<?php

	foreach ($output_messages as $message)

	{

    	echo $message."<br />";

	}

?>

<form action="" method="post">

MySQL connection parameters:

<table border="0">

  <tr>

    <td>Host:</td>

    <td><input  name="mysql_host" value="<?php if(isset($_REQUEST['mysql_host']))echo $_REQUEST['mysql_host']; else echo 'localhost';?>"  /></td>

  </tr>

  <tr>

    <td>Database:</td>

    <td><input  name="mysql_database" value="<?php echo $_REQUEST['mysql_database']; ?>"  /></td>

  </tr>

  <tr>

    <td>Username:</td>

    <td><input  name="mysql_username" value="<?php echo $_REQUEST['mysql_username']; ?>"  /></td>

  </tr>

  <tr>

    <td>Password:</td>

    <td><input  type="password" name="mysql_password" value="<?php echo $_REQUEST['mysql_password']; ?>"  /></td>

  </tr>

  <tr>

    <td>Output format: </td>

    <td>

      <select name="output_format" >

        <option value="SQL" <?php if( isset($_REQUEST['output_format']) && 'SQL' == $_REQUEST['output_format']) echo "selected";?> >SQL</option>

        <option value="CSV" <?php if( isset($_REQUEST['output_format']) && 'CSV' == $_REQUEST['output_format']) echo "selected";?> >CSV</option>



        </select>

    </td>

  </tr>

</table>

<input type="submit" name="action"  value="Test Connection"><br />



  <br>Dump options(SQL):

  <table border="0">



    <tr>

      <td>Drop table statement: </td>

      <td><input type="checkbox" name="sql_drop_table" <?php if(isset($_REQUEST['action']) && ! isset($_REQUEST['sql_drop_table'])) ; else echo 'checked' ?> /></td>

    </tr>

    <tr>

      <td>Create table statement: </td>

      <td><input type="checkbox" name="sql_create_table" <?php if(isset($_REQUEST['action']) && ! isset($_REQUEST['sql_create_table'])) ; else echo 'checked' ?> /></td>

    </tr>

    <tr>

      <td>Table data: </td>

      <td><input type="checkbox" name="sql_table_data"  <?php if(isset($_REQUEST['action']) && ! isset($_REQUEST['sql_table_data'])) ; else echo 'checked' ?>/></td>

    </tr>

  </table>

  <br>Dump options(CSV):

  <table border="0">

  <tr>

    <td>Delimiter:</td>

    <td><select name="csv_delimiter">

      <option value="," <?php if( isset($_REQUEST['output_format']) && ',' == $_REQUEST['output_format']) echo "selected";?>>,</option>

      <option value="Tab" <?php if( isset($_REQUEST['output_format']) && 'Tab' == $_REQUEST['output_format']) echo "selected";?>>Tab</option>

      <option value="|" <?php if( isset($_REQUEST['output_format']) && '|' == $_REQUEST['output_format']) echo "selected";?>>|</option>

    </select>

    </td>

  </tr>

  <tr>

    <td>Table:</td>

    <td><input  type="input" name="mysql_table" value="<?php echo $_REQUEST['mysql_table']; ?>"  /></td>

  </tr>

	<tr>

      <td>Header: </td>

      <td><input type="checkbox" name="csv_header"  <?php if(isset($_REQUEST['action']) && ! isset($_REQUEST['csv_header'])) ; else echo 'checked' ?>/></td>

    </tr>

</table>





<input type="submit" name="action"  value="Export"><br />

</form>

</body>

</html>



<?php

}

?>



```
