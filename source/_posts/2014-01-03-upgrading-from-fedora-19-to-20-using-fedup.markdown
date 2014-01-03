---
layout: post
title: "Upgrading from Fedora 19 to 20 using FedUp"
date: 2014-01-03 19:32:48 +0000
comments: true
author: joseph
categories: 
 - Fedora
tags: 
 - fedora
 - upgrade
 - fedup
 - linux
description: "A quick guide to upgrading Fedora 19 to 20 using the FedUp tool"
---

I decided to upgrade to the latest version because why not, its the first Friday of the year.

The first thing to do is head over to [this page](https://fedoraproject.org/wiki/FedUp) which explains how to use the tool.

I spotted the note about the 19-20 upgrade not working unless you install the bleeding edge version of the tool so thats to do first:

```
sudo yum -y --enablerepo=updates-testing install fedup
```

You also need to make sure that your system is fully up to date so lets do that. Once this is done you probably want to reboot to be on the safe side.

```
sudo yum -y update
```

Once that is all done then you need to run the fedup command itself:

```
sudo yum -y update fedup fedora-release
sudo fedup --network 20
```

*I did this though and had an issue with RMPFusion. To fix that you need to run this command, then run the fedup command again:*
```
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-20
sudo fedup --network 20
```

Once fedup completes successfully you can reboot and will have an upgrade option as your first GRUB option when booting up. Select that to start the main upgrade.
It takes a while, make a brew or something.

Once you log in, you will no doubt notice some of your Gnome Shell Extensions are not working. Thankfully the process of upgrading these is pretty painless, just head over to 
[https://extensions.gnome.org/local/](https://extensions.gnome.org/local/) and you will see all your extensions. Any that are not compatible with your new version of Gnome Shell will have OUTDATED written where the on/off slider usually resides. Those with upgraded versions will have an upgrade button. Click that for each one, accepting the prompt.
When that's done, refresh the page and you should see all your upgraded extensions are now working. 

For me the only one I'm really going to miss is the [Quick Close in Overview](https://extensions.gnome.org/extension/352/middle-click-to-close-in-overview/) which is really handy, hopefully will be updated soon.

