---
layout: post
title: "GoAccess - Nice CLI Access Log Parsing Tool (and how to install on CentOS)"
date: 2014-04-24 12:40:27 +0100
comments: true
author: joseph
categories: 
 - sysadmin
tags: 
 - centos
 - nginx
 - logs
 - parse
 - goaccess
 - linux
description: "GoAccess is a nice command line utility for working with your access logs and gaining useful information from them quickly"
---

Log files are probably the single most useful item on a web server when it comes to debugging. They are packed full of all the information you need to understand what is
happening on the server and detect any potential issues.

Reading log files by hand is basically imposssible for any meaningful overall monitoring. You can of course do some grepping and other bash tools to gain more insights but some times it's nice to just have a simple tool.

I am a big fan of tools like top, mytop, apachetop and ngxtop. GoAccess is a little bit different though, mainly it just seems a lot more fully featured.

Best thing to do is to try it. Here is how to install it on CentoOS

``` bash
yum install ncurses-devel glib2-devel geoip-devel
mkdir -p ~/goaccess
cd ~/goaccess
wget http://downloads.sourceforge.net/project/goaccess/0.7.1/goaccess-0.7.1.tar.gz
tar -xzvf goaccess-0.7.1.tar.gz
cd goaccess-0.7.1/
./configure --enable-geoip --enable-utf8
make
make install

```

You can read more about GoAccess here:
[http://goaccess.prosoftcorp.com/](http://goaccess.prosoftcorp.com/)
