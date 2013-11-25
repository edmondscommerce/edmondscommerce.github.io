---
layout: post
status: publish
published: true
title: HOSTS file, Vista and Blocking Unwanted Adverts
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 9
wordpress_url: http://www.edmondscommerce.co.uk/blog/windows/hosts-file-vista-and-blocking-unwanted-adverts/
date: 2008-02-08 15:52:50.000000000 +00:00
categories:
- Windows
tags:
- hosts file
- msn
- adverts
- vista
- blocking
- security
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
The hosts file is a highly useful little text file that most people are not really aware of. Basically what it does is set a specific url to an IP address that you specify. This is great for testing web server etc. Also, we can block unwanted content by changing the IP address for the URLs that the adverts are coming from. The convention is to change the IP address to 127.0.0.1 which basically means the local computer itself.

<strong>Editing the HOSTS File </strong>

Your hosts file can usually be found in

c:/windows/system32/drivers/etc/

it is a text file, but does not have .txt at the end - it has no dot at all.

To edit it in XP, simply right click the file and select to open in notepad. Make your edits then save the file. For your edits to work you will generally have to restart whichever programmes you wanted to change the behaviour of.

<strong>Editing the HOSTS File in Windows Vista </strong>

The HOSTS file is much more secured under Windows Vista. This is fair enough because malicious changes to your HOSTS file could set you up for all kinds of things such as phishing attempts etc. However it does make it a bit more tricky for you to edit it yourself.

Heres how to do it:

1)  Browse to Start -&gt; All Programs -&gt; Accessories
2)  Right click "Notepad" and select "Run as administrator"
3)  Click "Continue" on the UAC prompt
4)  Click File -&gt; Open
5)  Browse to "C:\Windows\System32\Drivers\etc"
6)  Change the file filter drop down box from "Text Documents (*.txt)" to "All Files (*.*)"
7)  Select "hosts" and click "Open"
8)  Make the needed changes and close Notepad.  Save when prompted.

<strong>Block MSN Messenger Adverts.</strong>

I am not a big fan of in your face adverts, especially within applications. MSN messenger adverts are easy to get rid of though. All we need to do is edit the hosts file, save it and then restart the program.

1.) Open your HOSTS file for editing

2.) Paste the following into the bottom of your HOSTS file:
<pre># Windows Live Messenger ad servers

127.0.0.1  rad.msn.com

127.0.0.1  global.msads.net

127.0.0.1  rss.video.msn.com

127.0.0.1  ads1.msn.com

127.0.0.1  rad.live.com

127.0.0.1  specials.uk.msn.com</pre>
3.) Save Your HOSTS File

4.) Restart MSN Messenger
