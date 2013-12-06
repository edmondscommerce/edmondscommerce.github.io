---
layout: post
status: publish
published: true
title: Gnome 3 Bind Mouse Keys to Alt Tab and Overview
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4211
wordpress_url: http://www.edmondscommerce.co.uk/?p=4211
date: 2013-04-03 19:02:26.000000000 +01:00
categories:
- magento
tags:
- tab
- gnome
- bind
- mouse
- button
- config
- gnome shell
- xbindkeys
- xdotool
- alt
- overview
---
If you have switched to Gnome Shell or Gnome 3 then you are no doubt making a lot of use of the overview and alt tab functionality to switch between your windows.

To make this easier (if you have a mouse with extra buttons) you can map your extra buttons to do these actions with a few simple tools.

Firstly you need to install xbindkeys and xdotool

```bash

sudo apt-get install xbindkeys xdotool

```

If you need to know your mouse buttons, try running this command:

```bash

xev | grep button

```

This will give you a window you can click on with your mouse and it will tell you which button you clicked.

Then finally you need to edit your xbindkeys configuration. This is my xbindkeys config:

```

#gnome shell button 8 to alt tab
&quot;xdotool keydown alt key Tab; sleep 2; xdotool keyup alt&quot;
release + b:8

#gnome shell button 9 to overview
&quot;xdotool key Super_L&quot;
release + b:9

```



