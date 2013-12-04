---
layout: post
status: publish
published: true
title: Using PHP to Stream SQL results dynamically as CSV, even to IE
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2287
wordpress_url: http://www.edmondscommerce.co.uk/?p=2287
date: 2011-06-06 10:49:46.000000000 +01:00
categories:
- php
tags:
- mysql
- php
- csv
- dynamic
- feed
- download
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you want to offer a csv feed and want the results to be on demand and like the idea of avoiding messing about righting to files on the server etc, you might like this little manuever.

You will notice I'm using a non standard db_query function, just assume that this does all the sensible stuff it should.

Also the query needs to be modified to suit.

The trick is writing to PHP's built in php://output stream which is basically just STDOUT.

Note the headers which are specifically required to get IE to accept the file as a download. Other browsers will accept less headers but will also work fine with these.

```php


header("Pragma: public");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private", false);
header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename=\"file.csv\";");
header("Content-Transfer-Encoding: binary");

$outstream = fopen("php://output", 'w');

$sql = " select * from a_table";
$q = db_query("$sql");

$header = false;
while ($r = mysql_fetch_assoc($q)) {
    if (!$header) {
        fputcsv($outstream, array_keys($r));
        $header = true;
    }
    fputcsv($outstream, $r);
}
fclose($outstream);

```
