---
layout: post
status: publish
published: true
title: Setting up a 64bit Linux PHP Development Enviroment
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 121
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=121
date: 2009-04-03 08:42:39.000000000 +01:00
categories:
- php
tags:
- development
- php
- linux
- 64bit
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
This is a guide to setting up a PHP web development environment on a 64 bit Linux. I have used this on Ubuntu Intrepid 64bit and also Open Suse 11.1 64bit.

<b>Install XAMPP</b>
To get the ball rolling nice and quickly I have installed XAMPP for Linux which is available <a href="http://www.apachefriends.org/en/xampp-linux.html" rel="nofollow">here</a>. Then the first thing to do once XAMPP is running is to run the security wizard to set passwords etc.

It is possible to download all the LAMP components using your particular Linux package manager, however I like XAMPP because it is the same no matter which flavour of Linux you install it on, its set up to be a development environment rather than a production server and is generally nice and easy to use. It comes bundled with phpMyAdmin as well and requires no configuration to get up and running.

<b>XAMPP Control Panel</b>
A nice easy way to start, stop and restart all or some of the LAMPP services is to set up the control panel. XAMPP comes bundled with a python control panel, however you will need to manually create a shortcut to load the control panel.

Create an application launcher with the command 
```
gksudo python /opt/lampp/share/xampp-control-panel/xampp-control-panel.py
```


<b>Xdebug</b>
I want to get xdebug working so I have been following some instructions I found <a href="http://www.sanisoft.com/blog/2007/06/23/how-to-install-xdebug-php-extension-for-xampp-on-linux/">here</a>

In order to get these instructions to work, I had to first install autoconf. I used Syntaptic Package Manager (System->Administration->Syntaptic Package Manager) and then searched for autoconf.

Then it turns out that as I am running 64bit, the xdebug.so I have just made won't work. Thankfully it turns out its possible to download a precompiled 32bit xdebug.so file from <a href="http://aspn.activestate.com/ASPN/Downloads/Komodo/RemoteDebugging" rel="nofollow">here</a>. 

You can download this file and whack it into your /opt/lampp/lib/php/extensions folder.  (Note for Open Suse I have installed <a href="http://www.kde-apps.org/content/show.php/Simple+Root+Actions+Menu?content=72762" rel="nofollow">this root menu extension</a> which helps in editing or moving things around as root without having to open the terminal.)

Next you need to add the following line to the bottom of your php.ini file (located in /opt/lampp/etc/php.ini):
```

zend_extension=/opt/lampp/lib/php/extensions/xdebug.so
xdebug.remote_enable=On
xdebug.remote_host="localhost"
xdebug.remote_port=9000
xdebug.remote_handler="dbgp"

```

Then to check if its all working, go to http://localhost/xampp/phpinfo.php and you should see a message like "with Xdebug v2.1.0-dev, Copyright (c) 2002-2008, by Derick Rethans". 

<b>Eclipse</b>
Found some excellent tutorials on setting up Eclipse <a href="http://www.64bitjungle.com/ubuntu/full-64-bit-or-32-bit-web-development-and-php-mysql-ide-with-eclipse-34-ganymede-and-pdt-2/" rel="nofollow">here</a>, including instructions on getting the JRE working properly and also linking it up to Xdebug. The tutorial isn't based on an XAMPP setup though but should be easy enough to apply to my situation.

Another tutorial that is useful is <a href="http://malibugarage.blogspot.com/2007/07/local-workstation-xamppeclipse.html" rel="nofollow">this one</a> and also <a href="http://2tbsp.com/node/40" rel="nofollow">this one</a>

Once Eclipse is installed you will need to tweak the settings so that it can find the correct PHP executable and is set to use the xdebug extension for debugging.

Eclipse creates a folder called a workspace, which is where all the project files are stored. Its handy to make the workspace accessible to Apache and the easiest way to do this is to create a symbolic link from the htdocs folder in you lampp directory to the home/user/workspace folder.



<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://linuxfilesystem.com/tech/flash-player-10-on-64bit-linux" rel="nofollow">Flash Player 10 on <b>64bit</b> Linux | LinuxFileSystem.com</a><br><a href="http://www.tswarez.org/?p=1139" rel="nofollow">Dassault Systemes Catia V5R18 Sp8 <b>64Bit</b> Rapidshare, Megaupload <b>...</b></a><br><a href="http://www.bulgariagazette.com/bulgaria-to-aid-the-financial-development-of-neighbouring-countries/" rel="nofollow">Bulgaria to aid the financial <b>development</b> of neighbouring <b>...</b></a><br><a href="http://developers.sugarcrm.com/wordpress/2009/04/02/php-testers-needed/" rel="nofollow">Sugar Developer Blog » Blog Archive » <b>PHP</b> Testers needed</a><br><a href="http://techportal.ibuildings.com/2009/03/31/php-and-the-cloud/" rel="nofollow"><b>PHP</b> and the Cloud - techPortal</a><br></div>
