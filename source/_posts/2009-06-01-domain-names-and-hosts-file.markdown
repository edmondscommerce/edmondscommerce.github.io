---
layout: post
status: publish
published: true
title: Domain Names and HOSTS File
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 415
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=415
date: 2009-06-01 17:11:10.000000000 +01:00
categories:
- hosting
tags:
- hosts file
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you have recently bought a domain name and updated the nameservers to point to your new hosting, or if you are moving hosts and have update the nameservers for your existing domain name then for a period of up to 48 hours people who type in your domain name into their web browser might get directed to the old server or the new server.

This period is called propogation and these days can be over quite quickly, but is still an important point to be aware of. 

However what do you do if you need to make sure you are looking at your new server and not your old server?

You have two options really, you can wait for the propagation to complete or you can edit your HOSTS file to force your computer to look at your new server when you type your domain name.

This is really quite easy. You only need to know one thing which is the IP address of your new server.

Then you find your hosts file on your computer, open it up in a text editor like notepad (for windows) and add a line like this:

```

123.123.123.123 www.mydomain.com

```

at the bottom of the file. Then save that file, close all of your web browser windows and reopen a browser session and if you type your domain name you should get forced through to the new server.

<a href="http://en.wikipedia.org/wiki/Hosts_file#Location_and_default_content" target="_blank">See this wikipedia page for info on where to find your HOSTS file.</a>

For windows users, you can generally find your HOSTS file here:
c:windowssystem32driversetc
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://jrwren.wrenfam.com/blog/2009/05/25/using-the-mvpsorg-hosts-file-with-isc-bind/" rel="nofollow">Jay R. Wren - lazy dawg evarlast » Blog Archive » Using the MVPS <b>...</b></a><br><a href="http://www.activoinc.com/blog/2009/05/15/avoid-editing-hosts-file-by-using-foxyproxy-plugin-for-firefox/" rel="nofollow">About Web Development by Activo » Avoid editing &#39;<b>hosts</b>&#39; <b>file</b> by <b>...</b></a><br></div>
