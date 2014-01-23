---
layout: post
status: publish
published: true
title: 'PHP : Dead Easy Excel Export '
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 63
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-dead-easy-excel-export/
date: 2008-07-09 10:21:40.000000000 +01:00
categories:
- php
- excel
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Some people like their excel files. For people who want their data exported in an excel format checkout this chunk of code. It's really easy :-)

First of all you need to download this <a href="http://www.phpclasses.org/browse/package/1919.html" title="php excel" target="_blank">php excel class </a>

Now try this code:

```php

$query = mysql_query("select * from table");
while($q = mysql_fetch_assoc($query)){
	$output[] = $q;
}
require_once "excel.php";
$export_file = "xlsfile://export.xls";
$fp = fopen($export_file, "wb");
if (!is_resource($fp))
{
    die("Cannot open $export_file");
}
fwrite($fp, serialize($output));
fclose($fp);
header ("Content-Type: application/x-msexcel");
header ("Content-Disposition: attachment; filename=\"exports.xls\"" );
readfile("xlsfile://export.xls");
exit;

```

That's got to be the easiest thing you have ever done in PHP. Thanks goes to the excellent PHP Classes site.

<strong>Here is some further reading:</strong>
<a rel="nofollow" href="http://ewbi.blogs.com/develops/2007/05/php_excel_formu.html">PHP Excel Formula Parser</a>
<a rel="nofollow" href="http://chumby.net/2007/03/27/php-excel-export-class/">PHP Excel Export class</a>
<a rel="nofollow" href="http://www.oracleappsblog.com/index.php/weblog/comments/88/">Export data directly to Excel by configuring the MIME Type Profile Option</a>
<a rel="nofollow" href="http://blogs.vinuthomas.com/2008/06/07/power-your-php-business-logic-with-excel/">Power your PHP Business Logic with Excel</a>
<a rel="nofollow" href="http://amiworks.co.in/talk/readingparsing-excel-spreadsheet-using-php/">Reading/Parsing Excel Spreadsheet using PHP</a>
<a rel="nofollow" href="http://jaxn.org/article/2003/11/11/using-php-to-create-excel-spreadsheets/"></a>
