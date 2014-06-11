---
layout: post
title: "Prevent Ctrl+S Freezing Your Terminal"
date: 2014-06-11 10:30:25 +0100
comments: true
author: joseph
categories: 
 - linux
tags: 
 - linux
 - terminal
 - bash
 - scroll
 - freeze
description: "A quick tip to prevent your terminal from locking up if you hit Ctrl+S"
---
As someone who types a lot of text everyday and am generally quite keen not to lose my work, I tend to hit the key combination [Ctrl]+[S] quite a lot. 
In fact its almost become muscle memory that every sentence or two I will hit that combination.

When working on a terminal, this can have the unfortunate outcome that the terminal freezes up. For more time than I would like to admit, I thought that this was a Linux bug
And found myself frequently restarting terminal sessions that had locked up.

Then I discovered that you can unlock this when it freezes by hitting [Ctrl]+[Q]. However this is a bit of a pain.

I have now discovered a way of turning off this behaviour completely which is a real relief. Simply add the following to your .bashrc file:

```
#Prevent Ctrl+S Freezing Terminal
stty -ixon
```

Credit goes to this Stackoverflow post:
http://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal
