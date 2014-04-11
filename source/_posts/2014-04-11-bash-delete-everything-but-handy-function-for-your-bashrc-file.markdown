---
layout: post
title: "Bash Delete Everything But - Handy Function for your bashrc File"
date: 2014-04-11 11:23:16 +0100
comments: true
author: joseph
categories: 
 - bash
tags: 
 - bash
 - linux
 - bashrc
 - rm
description: "Quick command to delete everything but one file/folder"
---

For me the use case was a cache directory that I wanted to clear out everything apart from one particular file that was expensive
to create and didn't need to be cleared for my purposes

I decided to add this to my ~/.bashrc file for ease of use in future.

Here is the function

``` bash

# Remove Everything But
function rmbut(){
    local BUT="$@"
    ls | grep -v *$BUT* | while read f; do rm -rf $f; done
}
```

To use the function, simply `cd` to the directory you want to clear out and then call `rmbut MyFileIWantToKeep`
