---
layout: post
title: "Finding out the biggest folders in a Magento or other website root"
date: 2014-03-04 16:10:19 +0000
comments: true
author: kenneth
categories: 
 - bash
tags: 
 - bash
 - magento
 - linux
 - shell
 - files
 - rsync
description: Getting a list of subfolders ranked by content size
---

Often pulling down a Magento or other site you'll find a load of files that have been dumped in the web root. Downloading these is often pointless and takes extra time, so you'll want to exclude them from an rsync (using the `--exclude 'path'` paramter).

A simple bash command for this is:

```bash

du -m --max-depth=1 --exclude media | sort -n

```

This invokes `du` to show each direct subfolder's contents' size, and pipes it through to `sort` to rank them in increasing size. The sizes are in MB. See [a more broken down explanation here](http://explainshell.com/explain?cmd=du+-m+--max-depth%3D1+--exclude+media+|+sort+-n)
