---
layout: post
status: publish
published: true
title: Block Google Analytics Cookies to Stop Staff Contaminating your Data
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 82
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/block-google-analytics-cookies-to-stop-staff-contaminating-your-data/
date: 2008-11-25 16:10:58.000000000 +00:00
categories:
- business
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Many webmasters use Google Analytics to track their web traffic. This is a good idea and can be really useful in helping you to optimise your site and maximise your conversions.

However if your staff are constantly browsing your site, they will totally contaminate the data.

It is easy to block this though. All you need to do is add the following line to your HOSTS file

```

# [Google Inc]
127.0.0.1 www.google-analytics.com

```

<b>Finding Your HOSTS file</b>
The hosts file is located in different locations in different operating systems and even in different Windows versions:
<ul>
    <li> Windows NT/2000/XP/2003/Vista: %SystemRoot%\system32\drivers\etc\ is the default location, which may be changed. The actual directory is determined by the Registry key \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\DataBasePath.
   <li> Windows 95/98/Me: %WinDir%\
    <li> Linux and other Unix-like operating systems (including iPhone OS): /etc
    <li> Mac OS 9 and earlier: System Folder: Preferences or System folder (format of the file may vary from Windows and Linux counterparts)
   <li> Mac OS X: /private/etc (uses BSD-style Hosts file)
    <li> OS/2 and eComStation: "bootdrive":\mptn\etc\
   <li> Symbian 1st/2nd edition phones: C:\system\data\hosts
    <li> Symbian 3rd edition phones: C:\private\10000882\hosts, only accessible with file browsers with AllFiles capability, most are not. 
</ul>
