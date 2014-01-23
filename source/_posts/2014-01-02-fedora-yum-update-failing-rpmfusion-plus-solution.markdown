---
layout: post
title: "Fedora Yum Update Failing - RPMFusion + Solution"
date: 2014-01-02 10:42:59 +0000
comments: true
author: joseph
categories: 
 - Fedora
tags: 
 - fedora
 - linux
 - rpmfusion
 - yum
 - update
description: "Yum update failing in Fedora due to RPMFusion, try this solution"
---

I found that Fedora was completely failing to update with the normal GUI based software update system. A prompt would be repeatedly displayed and then the process would die.

To see what was really going on I ran yum update from the command line

```
sudo yum -y update
```

This died with the following error message:

```
Couldn't open file /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-19
```

It looks like something has been corrupted. A quick google around describes some possible causes and solutions however I thought I would try the obvious one first and just reenable RPMFusion.

To do that you can run this simple command (again in the command line):

```
su -c 'yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```

I did this and then ran the yum update command again and everything is fixed.
