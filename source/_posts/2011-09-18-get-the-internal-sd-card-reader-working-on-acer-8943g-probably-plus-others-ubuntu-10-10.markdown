---
layout: post
status: publish
published: true
title: Get the Internal SD Card Reader working on Acer 8943G (probably plus others)
  - Ubuntu 10.10
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2649
wordpress_url: http://www.edmondscommerce.co.uk/?p=2649
date: 2011-09-18 13:22:40.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- linux
- solution
- card
- reader
- acer
- aspire
- sd
- sdhc
- internal
- dmesg
- adma
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
After a bunch of digging around trying to find out how to get my internal SD card reader working in Ubuntu 10.10 I have found this solution:

Looking at dmesg, the error I was getting was this:
```

mmc0: ADMA error
mmc0: error -5 whilst initialising SD card

```

I found the solution here:
<a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/660088">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/660088</a>

```
cd /etc/modprobe.d
sudo vim sdcardread.conf
```

Now you need to paste this line into the file and save:

```
options sdhci debug_quirks=0x40

```

now you need to run these commands

```
sudo rmmod sdhci_pci
sudo rmmod sdhci
sudo modprobe sdhci
sudo modprobe sdhci_pci

```

Then if you re insert your SD card and view dmesg, you should no longer see the error message
```

dmesg

```
