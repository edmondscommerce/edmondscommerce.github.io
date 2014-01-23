---
layout: post
status: publish
published: true
title: 'Mate: Make Keyboard Calculator Button Work Again, and gedit etc.'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3391
wordpress_url: http://www.edmondscommerce.co.uk/?p=3391
date: 2012-09-05 13:48:20.000000000 +01:00
categories:
- linux
tags:
- ubuntu
- linux
- solution
- keyboard shortcut
- tip
- shortcut
- mate
- linux mint
---
One of the things that has not yet been fixed in mate is that the physical calculator button available on a lot of keyboards is mapped to "gcalctool" still but mate calls this "mate-calc"

A quick and easy fix is to ensure you have a bin folder inside your home directory (e.g. /home/edmondscommerce/bin/ ) and run the following commands at a shell :-

```bash

cd ~/bin
ln -s `which mate-calc` gcalctool

```

This means that anything that calls gcalctool will call mate-calc by default.  The bin directory has to exist at login time to be added to the path so you may have to log out and back in to enable it.

If you have gnomey habits like pressing Alt+F2 and typing "gedit" you might find the following few aliases are handy too :-
```bash

ln -s `which caja` nautilus
ln -s `which pluma` gedit
ln -s  `which evince` atril
ln -s  `which eog` eom

```
