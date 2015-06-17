---
layout: post
title: "Preparing Fedora for development with PHP Storm"
date: 2015-06-15 16:25:22 +0100
comments: true
author: dcallagh
categories: php
tags: 
 - Linux
 - Fedora
 - PHPStorm 
description: "If you are having issues setting up your favourite IDE this may help"
---

Today I was asked to prepare a workstation system for development with PHP Storm, this was my first time using Fedora over the popular Ubuntu so here's how it went.

Starting out, I visited the PHP Storm website hosted by the friendly people over at JetBrains to get a hold of my favourite IDE to develop with.
The package comes as a compressed tar ball that needs extracting with your favourite decompression software of choice.

After extracting the IDE it is time to do install it, when I attempted this I quickly ran in to a problem with the open source version of Java that comes pre-installed with Fedora.
To remedy this you need to get the Oracle version of the Java Run Times to install and run PHP Storm successfully.

After installing Java it is important that you tell Fedora to use Oracle's version over the pre-installed OpenJDK mentioned before.

`alternatives --install /usr/bin/java java /usr/java/latest/jre/bin/java 200000`

This will force Fedora to use this specific version of Java over the default, the procedure is similar to using an alias.

After we have Fedora setup to use the correct version of Java we can happily install and run PHP Storm.
CD in to your extracted PHP Storm folder we created earlier.

    cd bin
    ./phpstorm.sh


During the process you will be given the option to create a shortcut meaning you won't need to use the terminal to launch the IDE.
With that said, you can now happily use PHP Storm to develop your applications, be wary if you switch your Java version back to open source as it may not be supported.