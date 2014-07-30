---
layout: post
title: "GUI Editor Alike Terminal Editor"
date: 2014-07-30 17:50:40 +0100
comments: true
author: joseph
categories: 
 - linux
tags: 
 - slap
 - node
 - npm
 - editor
 - cli
description: "Looking for an alternative command line text editor that behaves like a standard GUI editor?"
---

Came across an interesting Github project today - a command line text editor that is designed to look and feel and largely behave like a GUI text editor such as Sublime.

Meet [Slap](https://github.com/slap-editor/slap)

Installation is trivial assuming you already have node installed:

``` 
npm -g install slap
```

Once its installed you can open any file as you would with any other cli text editor

```
slap my-file.php
```

Immediate impressions are quite positive. A familiar feeling file browser in the left column is coupled with a text editing pane on the right that responds well to mouse clicks and familiar key presses. 
The text highlighting is very nice and things like brace matching are also included.

Unfortunately for me it seems that mouse usage often lead to garbage characters being inserted into the text which render it unusable for the moment though this could be an issue specific to my machine.

Definitely a project to keep an eye on though if you like trying new CLI text editors. That said I'm writing this post in SPF13 Vim which I'm pretty happy with :)
