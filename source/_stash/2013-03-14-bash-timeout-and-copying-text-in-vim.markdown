---
layout: post
status: publish
published: true
title: Bash timeout and copying text in vim
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4137
wordpress_url: http://www.edmondscommerce.co.uk/?p=4137
date: 2013-03-14 12:59:42.000000000 +00:00
categories:
- bash
tags:
- development
- server
- bash
- vim
- helpful tips
- config
---
I have been working with a server that had been configured differently from the way that I prefer.

The two biggest complaints that I had about it were that the timeout was set very low, meaning that the connection would break off every five minutes, and that vim had been set up so if you selected text using the mouse you could not copy it.

The solutions to these two problems are as follows.

You can tell the terminal not to timeout with the following command

```bash

export TMOUT=0

```

Be aware that this will only work for the terminal that you are working with.

The issue with vim is that the mouse was triggering visual mode.

To get round this hold down shift when selecting text and everything will work as expected
