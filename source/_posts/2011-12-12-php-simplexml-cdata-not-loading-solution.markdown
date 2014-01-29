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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
