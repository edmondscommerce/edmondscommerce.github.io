---
layout: post
title: "Nice Gnome Shell Theme - Elegance Colours"
date: 2014-10-02 09:11:11 +0100
comments: true
author: joseph
categories: 
- linux
tags: 
- linux
- gnome
- gnome-shell
- theme
description: "A nice Gnome Shell theme for you to try out"
---
One of the nice features of Gnome Shell is that, with the help of the [User Theme](https://extensions.gnome.org/extension/19/user-themes/) extension, you can really customise
your desktop experience to be something personalised.

For me, the first thing is to set my desktop background to be a nice picture - something with wide open spaces, mountains and lots of sky.

The next thing though is to set up a user theme. I like transparency and themes that allow my well chosen background image to shine through.

For this reason I chose the [Elegance Colors](https://github.com/satya164/elegance-colors) theme as it has a "clear" preset which also includes functionality to set the colour scheme based 
on the background image which is pretty slick I think.

For installation instructions, please see the [README on Github](https://github.com/satya164/elegance-colors/blob/master/README.md)

## Quick Fedora instructions are here:


### Create Repo
``` bash
sudo sh -c " echo '[home_satya164_elegance-colors]
name=Elegance Colors Gnome Shell theme (Fedora_20)
type=rpm-md
baseurl=http://download.opensuse.org/repositories/home:/satya164:/elegance-colors/Fedora_20/
gpgcheck=1
gpgkey=http://download.opensuse.org/repositories/home:/satya164:/elegance-colors/Fedora_20/repodata/repomd.xml.key
enabled=1' > /etc/yum.repos.d/elegance-colors.repo"

```

### Install Theme
``` bash
sudo yum install gnome-shell-theme-elegance-colors
```

### Run the Setup
```
elegance-colors
```

### Switch to the Theme
``` bash
gsettings set org.gnome.shell.extensions.user-theme name 'elegance-colors'

```

### Now run the GUI and set it up
For this you can hit simply search for 'Elegance Colors' from the dash to load the GUI.

In the GUI you have presets and if you want transparency just choose the clear one. After that of course you can customise as you see fit

## Fonts

To make the most of Fedora, its well worth following [these instructions](http://worldofgnome.org/how-to-greatly-improve-font-rendering-under-fedora-20/) to improve font rendering.

