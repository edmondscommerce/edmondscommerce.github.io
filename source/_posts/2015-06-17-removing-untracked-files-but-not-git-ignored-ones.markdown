---
layout: post
title: "Removing untracked files but not git ignored ones"
date: 2015-06-17 12:06:25 +0100
comments: true
author: kenneth
categories: git
tags: 
 - git
 - untracked
 - bash
description: Removing untracked files but not git ignored ones
---

Quite often you drop a load of files in to a git repo, such as a Magento extension, and then immediately regret it. But now you have a pile of files scattered across the repo and no way to Ctrl+Z out of the situation.

This leaves us with some options:

- `git reset --hard HEAD`, but that'll only revert any changes to *tracked* files. What about the untracked files in `git status`?
- Manually `rm -rf file1 file2 folder1 folder2` but that's a lot of copypasting.
- `git clean -f`, but that *will remove all untracked files, including your gitignored ones*, so we don't want that.

The best way is to **automate the `rm -rf` procedure** mentioned above using the following command

    git status --porcelain | sed 's#^...##' | while read f; do rm -rf $f; done

The TL;DR of this command is that it outputs `git status` in a parseable way, and then loops over each file/folder and deletes it. You can see a [full command breakdown here](http://explainshell.com/explain?cmd=git+status+--porcelain+%7C+sed+%27s%23%5E...%23%23%27+%7C+while+read+f%3B+do+rm+-rf+%24f%3B+done).
