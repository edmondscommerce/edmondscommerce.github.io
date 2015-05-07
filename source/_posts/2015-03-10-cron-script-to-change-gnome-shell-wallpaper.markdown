---
layout: post
title: "Cron Script to Change Gnome Shell Wallpaper"
date: 2015-03-10 13:09:06 +0000
comments: true
author: joseph
categories: gnome-shell
tags: 
- gnome-shell
- dconf
- bash
description: "Simple Cron friendly BASH script to change Gnome Shell Wallpaper"
---

I've recently upgraded to Fedora 21 and one of my extensions was not compatible with the updated Gnome Shell version.

I tried some variations but found that it seemed to be having a big negative impact on performance. A simpler option was required.

Here it is - a simple BASH script that you can Cron up to change your background

``` bash
#!/usr/bin/env bash
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
GSETTINGS_BACKEND=dconf 
gsettings set org.gnome.desktop.background picture-uri '"file://'/home/joseph/Pictures/Wallpapers/$(ls /home/joseph/Pictures/Wallpapers/ | shuf -n 1)'"'

```

Add this line to your crontab to change

```
*/5 * * * * /home/joseph/Pictures/Wallpapers/CHANGE.bash
```

Obviously you need to change paths etc but this works nicely
