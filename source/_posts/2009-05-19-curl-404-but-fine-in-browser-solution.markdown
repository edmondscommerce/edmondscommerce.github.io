---
layout: post
status: publish
published: true
title: Curl 404 but Fine in Browser + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 391
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=391
date: 2009-05-19 13:55:09.000000000 +01:00
categories:
- scraping
tags:
- curl
- gzip
- '404'
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I just hit an intriguing situation where a page that was perfectly viewable in my browser was not visible via curl. 

I scratched my head and messed around testing the page in variety of online proxy services and local web browsers. I even stared messing about with telnet and manually typing headers. My conclusion was that the simpler systems such as text based browsers were not able to see the page and were instead given a 404 message.

However better more modern browsers could see the page. Likewise the page was visible in the Google cache and aso Google Translate.

In the end I downloaded a neat little firefox add-on called Tamper Data. This allows you to tweak your request headers before they are submitted. 5 minutes later I realised that it was the Gzip compatibility which was causing the issue.

Curl (being the awesome tool that it is) can handle Gzip compression, but I wasn't using it. I have now added the following line to my curl function and I am pulling pages fine.

```php

 if(!empty($compression)){
    curl_setopt($go,CURLOPT_ENCODING , $compression);
 }

```<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://warungkoe.cn/uncategorized/what-every-cfo-should-know-compliance-to-404-of-sarbanes-oxley-part-2.html" rel="nofollow">What every CFO should know Compliance to <b>404</b> of Sarbanes Oxley <b>...</b></a><br><a href="http://www.ideopia.com/wavybrainy/2009/05/naked-html-designers-glorify-error-404-pages/" rel="nofollow">WavyBrainy » Naked HTML: Designers Glorify Error <b>404</b> Pages</a><br><a href="http://www.danraine.com/smart-404-pages/" rel="nofollow">Smart <b>404</b> Pages « Dan Raine</a><br><a href="http://sceneddl.net/music/speaklowhandsup2009404/" rel="nofollow">SceneDDL » Speak Low-Hands Up-2009-<b>404</b></a><br><a href="http://www.404techsupport.com/2009/05/17/monitores-monitor-energy-saver/" rel="nofollow"><b>404</b> Tech Support » MonitorES - Monitor Energy Saver</a><br><a href="http://payhalf.com/2009/05/18/4999-rip-curl-core-22-xback-springsuit-shortsleeve-womens-by-whiskeymilitia/" rel="nofollow">[$49.99] Rip <b>Curl</b> Core 2/2 XBack Springsuit ShortSleeve Women`s by <b>...</b></a><br><a href="http://daniel.haxx.se/blog/2009/05/18/curl-7-19-5/" rel="nofollow">daniel.haxx.se » <b>curl</b> 7.19.5</a><br><a href="http://www.hansensurf.com/surfers/?p=401" rel="nofollow">HansenSurf Blog » » Rip <b>Curl</b> WLP Fanning Signature Boardshort</a><br><a href="http://dodoincfedora.wordpress.com/2009/05/15/curl-or-libcurl-for-the-app-noob-doubts/" rel="nofollow"><b>cURL</b> or libcurl for the app?? Noob doubts.. « Ankur&#39;s Fedora Blog</a><br><a href="http://www.ekremseren.com/2009/05/compression-tools-lzma-bzip2-gzip/" rel="nofollow">Compression Tools: lzma, bzip2 &amp; <b>gzip</b> | Ekrem SEREN&#39;s Weblog</a><br><a href="http://farrokhi.net/blog/archives/535" rel="nofollow">Multi-threaded <b>gzip</b> | Geek Style</a><br><a href="http://www.lateralcode.com/gzip-files-with-htaccess-and-php/" rel="nofollow"><b>GZip</b> files with .htaccess and PHP</a><br><a href="http://wadearnold.com/blog/?p=221" rel="nofollow"><b>GZip</b> compression is not part of AMF! | Wade Arnold</a><br><a href="http://www.webveteran.com/blog/index.php/web-coding/coldfusion/fix-for-ie6-and-gzip-compressed-javascripts/" rel="nofollow">Fix for IE6 and <b>gzip</b> compressed javascripts | Freelance Web <b>...</b></a><br></div>
