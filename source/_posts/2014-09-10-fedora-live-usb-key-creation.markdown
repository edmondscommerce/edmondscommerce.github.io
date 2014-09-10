---
layout: post
title: "Fedora Live USB Key Creation"
date: 2014-09-10 17:38:09 +0100
comments: true
author: joseph
categories: 
- Fedora
tags: 
- linux
- fedora
- usb
- install
description: "A way to create LiveUSB drives that actually works"
---
I have had continual problems getting most of my USB keys to work as liveusb drives.

This is pretty awkward however it looks like I have now found a solution that works. Instead of using the official Fedora live USB creator, we are going to use something called livecd-iso-to-disk

First of all install it:

``` bash
sudo yum -y install livecd-tools
```

Then this is your command to create the liveusb. Note you need to set the sdX to whichever your USB key is using, and of course make sure the path to the iso file is correct

```bash
sudo livecd-iso-to-disk --format --msdos --reset-mbr --overlay-size-mb 512 --home-size-mb 512 ~/Downloads/Fedora-Live-Desktop-x86_64-20-1.iso /dev/sdc
```

And that's it
