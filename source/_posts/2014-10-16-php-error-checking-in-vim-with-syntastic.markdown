---
layout: post
title: "PHP error checking in Vim with Syntastic"
date: 2014-10-16 11:27:40 +0100
comments: true
author: Ross
categories: 
 - Vim 
tags: 
 - PHP
 - coding standards
 - Vim
description: Get PHP error checking in Vim
---
If you are using Vim for any kind of PHP development work, then you may miss the sanity checking that is included in some IDEs.

However, it possible to add this in using the [Syntastic](https://github.com/scrooloose/syntastic)
plug-in. Installation is quite simple and can be handled by any of the common plug-in managers.

It should be noted that the plug-in just calls external checkers, so you will need to have these setup and configured,
but you should have this done already...
