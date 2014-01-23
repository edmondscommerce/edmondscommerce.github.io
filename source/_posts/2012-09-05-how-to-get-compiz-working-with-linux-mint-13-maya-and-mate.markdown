---
layout: post
status: publish
published: true
title: How to get Compiz working with Linux Mint 13 (Maya) and MATE
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3374
wordpress_url: http://www.edmondscommerce.co.uk/?p=3374
date: 2012-09-05 10:28:01.000000000 +01:00
categories:
- linux
- linux mint
tags:
- gnome
- compiz
- mint
- mate
- maya
---
With the Gnome world moving on to Gnome Shell and Unity some of us are finding frustrating  the lack of ability to tweak and configure afforded to us by Gnome 2. MATE has gone a long way to ensuring that we can continue to use the familiar desktop environment without the worry of using an outdated and insecure version of your favourite distribution.

One such area where an immense ability to configure our DE is Compiz which is no longer compatible with Gnome Shell. Using Compiz with MATE requires a little tweaking for it to work, but ultimately is as functional as it's always been.

<h2>Setting configurations</h2>

```bash
compiz --replace
```
Because Compiz is installed out of the box on Mint 13 (Maya), this does work. However you'll find yourself with ugly window decoration which doesn't fit in with your windows.

```bash
mateconf-editor
```
Navigate to <strong>/desktop/mate/session/required_components/windowmanager</strong> and set the value to <strong>compiz</strong>

```bash
gconf-editor
```
Navigate to <strong>/apps/metacity/general/theme</strong> and set the value to your Metacity theme name. Mint's default is <strong>Mint-X</strong>

<h2>Setting up Compiz plugins</h2>

You might find you need to tell Compiz to use the new Window Decorator. In CompizConfigSettingsManager you'll need to set the same into the Window Decoration plugin. Set the Command field to <strong>marco --replace</strong>

You'll need to enable some other Window Manager must-haves in the following plugins: <strong>Move Window</strong>, <strong>Resize Window</strong>, <strong>Grid</strong> and <strong>Application Switcher</strong> for alt+tab

This should be enough to get you going - I have the Scale plugin working (for Exposé style window switching)

It's still a little rough around the edges - here's a few issues I still have, with solutions:
<h2>Compiz occasionally crashes on MATE</h2>
Switch to another tty (Ctrl+Alt+F1) and run
```bash
marco --replace -d 0:0
```
Once back in your X display, run alt+F2 and run compiz --replace again

<h2>Workspace switching doesn't work in MATE</h2>
Set the amount of workspaces you'd like in CCSM > General Options > Desktop Size. Set your Horizontal Virtual Size and set Vertical Virtual Size to 1
Set your panel's workspace switcher to Number of Workspaces: 1
