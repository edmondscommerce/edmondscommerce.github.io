---
layout: post
status: publish
published: true
title: Netbeans Xdebug "Waiting for connection" Ubuntu 12.04 Mint13 +SOLUTION
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3153
wordpress_url: http://www.edmondscommerce.co.uk/?p=3153
date: 2012-06-21 17:07:20.000000000 +01:00
categories:
- netbeans
tags:
- development
- php
- ubuntu
- linux
- netbeans
- developer
- solution
- xdebug
- mint
- ipv6
---
If you have issues with netbeans and xdebug not connecting on recent distros, you might find that netbeans is listening on tcp6 and xdebug connecting on plain tcp.

To check if this is the case, run the following command whilst netbeans is "waiting for connection" (change 9000 if you've set a different port) :-

<code>netstat -aln | grep 9000</code>

if you get a line similar to the following (specifically tcp6 and not just tcp), it may well be that xdebug can't connect over ipv6 :-
<code>tcp6       0      0 :::9000                 :::*                    LISTEN</code>

One solution is to disable ipv6, which can be done by creating the file /etc/sysctl.d/10-disable-ipv6.conf with the following contents :-
<code>net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1</code>

then run (as root or sudo)
<code>sysctl -p /etc/sysctl.d/10-disable-ipv6.conf</code>
and restart netbeans.  Suddenly, netbeans will listen on tcp (ipv4) and xdebug will connect.
