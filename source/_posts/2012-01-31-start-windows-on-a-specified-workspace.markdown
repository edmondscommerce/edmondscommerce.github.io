---
layout: post
status: publish
published: true
title: Start windows on a specified workspace
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2916
wordpress_url: http://www.edmondscommerce.co.uk/?p=2916
date: 2012-01-31 14:04:27.000000000 +00:00
categories:
- linux
tags:
- ubuntu
- linux
- desktop
- window management
- wmctrl
---
I rely on multiple desktops in order to keep my workflow organised. However each time I start up my computer I have to move these windows onto the correct desktop, which is a pain. Thankfully there is a way to place each window onto it's own desktop when your computer starts. This will explain the basics of doing this.

First you need to install a tool called wmcrtl. On ubuntu you can do this by running this command

```
sudo apt-get install wmctrl
```

Once this is installed you need to see how it thinks you desktop is set up. You can do this by running this command

```
wmctrl -d
```

which give me the following result

```
0  * DG: 13440x1050  VP: 0,0  WA: 0,24 3360x1002  Workspace 1
```

The important part is the 13440x1050 - which corresponds to 8 1680x1050 desktops. Some versions of ubuntu put each desktop as a separate workspace, if so you'll need to modify the instructions slightly.

At this point you can move you windows around so they are where you want them to be. Once you are happy with your layout, run the following command

```
wmctrl -lG
```

which will give you something similar to this
```

0x0340002e  0 3360 48   1680 1002 ross-desktop Add New Post ‹ Edmonds Commerce — WordPress - Chromium
0x02a00077  0 23002 106  253  970  ross-desktop Buddy List
0x02200004  0 0    58   1680 1021 ross-desktop Terminal
0x06400003  0 6720 58   1680 1021 ross-desktop *untitled - Geany
...

```

This can be broken down as follows
```

window-id	desktop-number	x-ofset	y-ofset	width	height	machine-name	window-title

```

Using this information you can put together a script that will run at startup to launch you windows.

<strong>NB This script relies on the window title to move a window. This works because the script will be run at startup and it is assumed that you will only have one instance of each program running. If you plan to have multiple windows open, then you will need to get the window-id, go through the man pages for ways of doing this.</strong>

```

#!/bin/bash
geany /tmp/scratch.sql /tmp/scratch.php &
x-terminal-emulator &
# allow the windows to spawn before moving them
sleep 5
# select and move the windows
# format wmctrl -r "window to move" -e gravity,x-pos,y-pos,width,height (-1 keeps the current value)
wmctrl -r "scratch.php - /tmp - Geany" -e 0,6720,0,-1,-1
wmctrl -r "Terminal" -e 0,3360,0,-1,-1

```

save the file and make it executable, and then run it at startup to have your windows automatically appear where you want them. This is just scratching the surface of what wmctrl can do, so if you want to carry out more windows management from the command line go through the man pages and see if it can do what you want.
