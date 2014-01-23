---
layout: post
status: publish
published: true
title: Ubuntu Desktop Slideshow Recursive Folder
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1994
wordpress_url: http://www.edmondscommerce.co.uk/?p=1994
date: 2011-01-08 11:50:22.000000000 +00:00
categories:
- python
tags:
- ubuntu
- desktop
- xml
- gnome
- python
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you use Ubuntu, you probably use F-Spot for managing your photos. It's a nice app and it organises all your photos into a directory tree based on date.

If you want to set up a desktop slideshow that shows images from this folder tree then you need to create a custom XML file that you can then set as the desktop background. Of course you need a system to create the slideshow.

This script does just that:

<script type="text/javascript" src="http://snipt.net/embed/7cb620ed391c0a6e72548a0cc804fe3a"></script>

Inspired by a few scripts I found on the web, though <a href="http://royvandewater.com/blog/2009/12/ubuntu-wallpaper-slideshow/">this is the one I based it on</a>, simply modified to make it recursively pull images rather than just images in the current directory and also shuffle the resulting list.

Place the script in the root of your ~/Photos directory, mark it as executable and then run it. It generates an XML file for you. You can now go to your desktop, right click and go to background then hit the [Add] button.

Now navigate to your ~/Photos directory and select the generated XML file. Job done.
