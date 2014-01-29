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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
