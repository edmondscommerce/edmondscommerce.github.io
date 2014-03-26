---
layout: post
title: "Compare Text Chunks Quickly in PHPStorm"
date: 2014-03-26 11:34:50 +0000
comments: true
author: joseph
categories: "PHPStorm"
tags: 
 - phpstorm
 - php
 - tip
 - diff
description: "Quick way to diff two text chunks using PHPStorm"
---
Some times you just need to compare a few lines from one file to a few lines from somewhere else. Full blown file diffing will give you all kinds of false positive information, actually you just want to compare a few lines.

I had a look around and couldn't see an obvious way to do it but then I saw the "Compare with Clipboard" option in the right click menu.

To use this is really easy and super handy.

First of all, highlight one of the chunks of text and get it into your clipboard `[ctrl]+[c]`

Now highlight your second chunk of text and simply select the "Compare with Clipboard" option.

You will now get a standard PHPStorm diff viewer allowing you to compare the text chunks side by side.

