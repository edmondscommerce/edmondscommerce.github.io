---
layout: post
title: "Behat Selenium arguments[0] is undefined Problem + Solution"
date: 2015-02-17 12:33:51 +0000
comments: true
author: joseph
categories: 
 - behat
tags: 
 - behat
 - selenium
 - firefox
 - chrome
description: "Struggling with an infuriating issue with Selenium, giving the error message 'arguments[0] is undefined', read on for the solution"
---

Just spent a good amount of time struggling to see why my perfectly functional looking code was not working.

Tests were failing with the error message:

*arguments[0] is undefined*

A little bit of Googling later and I found the issue.

It seems that some Firefox versions will bomb out and give you this error message.

The simple solution, if you can, is to switch to using Chrome and Chromedriver


