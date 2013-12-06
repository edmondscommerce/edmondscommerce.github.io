---
layout: post
status: publish
published: true
title: How to Restore Hibernate After Deleting and Recreating Your Swap Partition
  in Mint 13, Mint 14 and Ubuntu 12.04, Ubuntu 12.10
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 3810
wordpress_url: http://www.edmondscommerce.co.uk/?p=3810
date: 2012-12-21 15:06:53.000000000 +00:00
categories:
- linux mint
tags:
- ubuntu
- mint
- hibernate
- swap
- uuid
---
As part of increasing my swap space in order to hibernate (my previous setup had 4GB of swap but 8GB of RAM) I had deleted and recreated my swap partition. There was no change in the partition's device files - it was still /dev/sda2, however my new swap partition seemed to be nonfunctional. This is down to the device's UUID having changed.

<h2>Finding your new UUID</h2>

To find the new UUID, issue:

```

$ ls -l /dev/disk/by-uuid/

```

You'll get this output. Just copy the UUID (the string of random letters and numbers), we'll use this soon

```

total 0
lrwxrwxrwx 1 root root 10 Dec 21 14:27 13823b29-79f5-485f-a260-ba4c4c7f2d92 -> ../../sda1
lrwxrwxrwx 1 root root 10 Dec 21 14:27 65056fdc-e6e7-4ed5-aa9b-9cc7f1bc2e69 -> ../../sda2

```

<h2>Fixing swap on bootup</h2>
You'll find that the new swap partition isn't available on boot, nor can it be manually enabled using sudo swapon -a. To fix these, use your favourite text editor to open /etc/fstab and add the new UUID on the swap line
```

UUID=65056fdc-e6e7-4ed5-aa9b-9cc7f1bc2e69 none            swap    sw              0       0

```

Issue a sudo swapon -a and check your System Monitor. If you have available swap then you're all good

<h2>Fixing hibernate</h2>
Because fstab is used way after the system decides whether to resume from Hibernate you'll need to update it on which partition it should resume from

Again, use your favourite text editor to open /etc/initramfs-tools/conf.d/resume. Add in your new UUID
```

RESUME=UUID=65056fdc-e6e7-4ed5-aa9b-9cc7f1bc2e69

```
Update your configuration for it to take effect, and hibernate will work just fine again
```

sudo update-initramfs -u

```
