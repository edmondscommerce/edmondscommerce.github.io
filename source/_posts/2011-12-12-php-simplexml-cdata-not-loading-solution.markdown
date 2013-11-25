---
layout: post
status: publish
published: true
title: PHP SimpleXML CData not loading + solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2765
wordpress_url: http://www.edmondscommerce.co.uk/?p=2765
date: 2011-12-12 17:29:28.000000000 +00:00
categories:
- php
tags:
- php
- problem
- xml
- solution
- debugging
- simplexml
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
The php simpleXML object is my preferred way of working with XML, but it has some unusual quirks that can drive you up the wall. One of these is that, by default, it will not read CDATA within an XML file, and will just leave the node blank.

If you need to access this data then create your xml object like this

<code>
$xmlFile = "/path/to/xml/file.xml";
if (file_exists($xmlFile)) {
$xml = simplexml_load_file($xmlFile,'SimpleXMLElement', LIBXML_NOCDATA);
echo $xml->cDataNode;
}
</code>
