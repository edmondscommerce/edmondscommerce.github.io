---
layout: post
status: publish
published: true
title: Generic XML to CSV Converter
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2676
wordpress_url: http://www.edmondscommerce.co.uk/?p=2676
date: 2011-10-12 11:02:59.000000000 +01:00
categories:
- php
tags:
- php
- function
- xml
- data
- tip
- convert
- legacy
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Some times you might have a legacy system that is built around csv or similar and you need to import an XML data source into this system.

Of course one possibility is to build full XML handling capabilities into the system. Perhaps a more sane solution is to simply convert the XML to CSV so that the legacy system does not have to be touched.

This little snippet will generally take an XML file and create a CSV file that should be useable. Of course its impossible to guarantee this for every XML file as its such a widely varied format, however in general this should work.

```php

$xml = simplexml_load_file('feed.xml');
$outstream = fopen('feed.csv','w');
$header=false;
foreach($xml as $k=>$details){
    if(!$header){
        fputcsv($outstream,array_keys(get_object_vars($details)));
        $header=true;
    }
    fputcsv($outstream,get_object_vars($details));
}
fclose($outstream);

```
