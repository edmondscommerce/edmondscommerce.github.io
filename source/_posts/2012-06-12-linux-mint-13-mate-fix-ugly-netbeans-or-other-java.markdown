---
layout: post
status: publish
published: true
title: Linux Mint 13 (MATE) Fix Ugly Netbeans (or other Java)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3149
wordpress_url: http://www.edmondscommerce.co.uk/?p=3149
date: 2012-06-12 16:26:12.000000000 +01:00
categories:
- netbeans
tags:
- linux
- bug
- problem
- netbeans
- solution
- java
- navigation
- window
- mint
- '13'
- mate
- ugly
- border
- menu
---
If you are using a Java application on your nice new Linux Mint desktop and are wondering why its so damn ugly, this might be your solution.

It looks like there is an issue with Java detecting your standard system style, fonts etc so it reverts to something pretty hideous.

One easy solution to at least get it looking alright (and also fixing a bug with menus and maximisation) is to set your netbeans conf to the following.

Simply go to your netbeans folder and look for an etc folder.

Inside there is a file called netbeans.conf

Back that up (rename to netbeans.conf.backup) and create a new file called netbeans.conf

Then paste this in:

```


# ${HOME} will be replaced by JVM user.home system property
netbeans_default_userdir="${HOME}/.netbeans/7.1.2"

# Options used by NetBeans launcher by default, can be overridden by explicit
# command line switches:
netbeans_default_options="-J-client -J-Xss2m -J-Xms32m -J-XX:PermSize=32m -J-Dapple.laf.useScreenMenuBar=true -J-Dapple.awt.graphics.UseQuartz=true -J-Dsun.java2d.noddraw=true -J-Dsun.zip.disableMemoryMapping=true"

#trying to fix teh UGLY
netbeans_default_options="${netbeans_default_options} --laf Nimbus -J-Dswing.aatext=true -J-Dawt.useSystemAAFontSettings=lcd"

# Note that default -Xmx and -XX:MaxPermSize are selected for you automatically.
# You can find these values in var/log/messages.log file in your userdir.
# The automatically selected value can be overridden by specifying -J-Xmx or
# -J-XX:MaxPermSize= here or on the command line.

# If you specify the heap size (-Xmx) explicitly, you may also want to enable
# Concurrent Mark & Sweep garbage collector. In such case add the following
# options to the netbeans_default_options:
# -J-XX:+UseConcMarkSweepGC -J-XX:+CMSClassUnloadingEnabled -J-XX:+CMSPermGenSweepingEnabled
# (see http://wiki.netbeans.org/FaqGCPauses)

# Default location of JDK, can be overridden by using --jdkhome <dir>:
netbeans_jdkhome="/opt/java/64/jre1.7.0_04"

# Additional module clusters, using ${path.separator} (';' on Windows or ':' on Unix):
#netbeans_extraclusters="/absolute/path/to/cluster1:/absolute/path/to/cluster2"

# If you have some problems with detect of proxy settings, you may want to enable
# detect the proxy settings provided by JDK5 or higher.
# In such case add -J-Djava.net.useSystemProxies=true to the netbeans_default_options.

```
