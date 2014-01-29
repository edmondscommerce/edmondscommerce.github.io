---
layout: post
title: "Clean Up Meld Files when Git Merging"
date: 2014-01-29 11:39:19 +0000
comments: true
author: joseph
categories: 
- git
tags: 
 - git
 - meld
 - merge
 - bash
 - grep 
description: "Cleaning out the files left behind by Meld when doing a Git Merge"
---

If you do a Git Merge using Meld (a brilliant Linux diff tool) then you might find that there are a bunch of files created that you need to clear up.

These files will be copies of the merged files and can be safely removed as everything you should need to know is already in Git.

I wrote the following quick function to find all of these files and remove them. You could add this as a function to your bashrc file if you need to do this regularly.

Here is the BASH snippet:

``` bash
git status -su | grep -P "\.BACKUP|BASE|LOCAL|REMOTE\." | cut -f2 -d" " | xargs rm
```

