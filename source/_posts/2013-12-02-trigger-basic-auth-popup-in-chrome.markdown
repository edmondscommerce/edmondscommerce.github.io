---
layout: post
title: "Trigger Basic Auth Popup in Chrome"
date: 2013-12-02 19:32:58 +0000
comments: true
author: joseph
categories: 
 - chrome
tags: 
 - basic auth
 - http
 - clear
 - credentials
description: "How to trigger the basic authentiation prompt in Chrome when already authenticated" 
---

In Chrome, if you have already authenticated with a site using Basic Authentiation (a Web Server level authentication) then you will have probably realised that once you are authenticated, Chrome does not continuously prompt you for the details, and that is a good thing.
However, in a scenario where perhaps you want to authenticate as a different user or otherwise re enter the details then it can be tricky to figure out how to do this.

The answer is simple enough, you can retrigger this prompt by putting your username@ the url and the pop up will be shown again.

To be clear:

```
http://www.somedomain.com
```

becomes:

```
http://username@www.somedomain.com
```
