---
layout: post
title: "Running out of disk space but df shows you have lots of space left"
date: 2015-05-07 10:32:04 +0100
comments: true
author: michael
categories: 
- linux
- vps
- server
tags: 
- linux
- disk space
- inode
- server
- vps
description: "Server reporting disk space shortage when there is plenty"
---

Had a strange occurency this morning with an server reporting it had no disk space when disk usage according to df was at 50%. After some head scratching I decided to read the man page for the df command and came across the -i flag. According the man page this lists inode information instead of block usage. After running it I got the following:

``` bash
Filesystem      Inodes   IUsed  IFree IUse% Mounted on
/dev/xvda1     2621440 2621440      0  100% /
udev            124879     398 124481    1% /dev
tmpfs           126892     288 126604    1% /run
none            126892       4 126888    1% /run/lock
none            126892       1 126891    1% /run/shm
none            126892       1 126891    1% /run/user
```

So it turned out that the system had reached its max inodes so the next line of investigation was to find any excess of files in an directory. Which was sone by using:
``` bash
for i in /var/*; do echo $i; find $i | wc -l; done
```

This will list the total number of files in a given directory. You can change the path to work your way down the directory tree finding directories with lots of files. In the end we found excess of old logs which I was able to remove.
