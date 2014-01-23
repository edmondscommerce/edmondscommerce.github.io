---
layout: post
title: "Getting Skype Working on Fedora 20"
date: 2014-01-17 14:45:29 +0000
comments: true
author: joseph
categories: 
 - Fedora
tags: 
 - fedora
 - linux
 - skype
description: "Getting Skype Working Nicely on Fedora 20"
---

I recently needed to get Skype working on Fedora 20 and unfortunately the process wasn't completely smooth, there were a few hoops I had to jump through.

I am making a note of these here for my own future reference and to help out any one else hitting problems like these.

To install Skype on Fedora 20 64bit, the first thing you need to do is download the [Fedora 32bit RPM from Skype](http://www.skype.com/en/download-skype/skype-for-linux/).

To install this you should use Yum so that dependancies are handled properly:

```
sudo yum install ~/Downloads/skype-4.2.0.11-fedora.i586.rpm
```

However I hit issues around the libvpx package. I have Chromium installed however it packages an incompatible version of libvpx which was blocking the installation. 
After a load of messing around the solution for me was so use Yum to remove that package, install the correct package and then install skype. 
One issue was that removing the package also removed programs that had it as a dependancy so after installing the correct version of libvpx, I had to reinstall those programs as well.

Here is the process in commands:

Firstly remove the package and install the i686 version
```
yum remove libvpx.x86_64
yum install libvpx.i686
```

Then install Skype
```
 yum install ~/Downloads/skype-4.2.0.11-fedora.i586.rpm
```

Then reinstall the 64 bit version of libvpx
```
 yum install libvpx.x86_64 
```

Then reinstall the programs that were removed when I removed libvpx
```
 yum install firefox.x86_64 pidgin.x86_64 pidgin-libnotify.x86_64 php-gd.x86_64 shotwell.x86_64 gnome-shell-extension-pidgin.x86_64 
```

That got Skype installed however testing it the audio was terrible. There is one last tweak that fixed this for me:

```
sudo gnome-open /usr/share/applications/skype.desktop
```

Change the line that reads **Exec=skype %U** to the following:

**Exec=env PULSE_LATENCY_MSEC=30 skype %U**

Restart Skype and the audio issues should be resolved.



