---
layout: post
title: "SELinux and connecting to Mysql databases on Red Hat based distributions"
date: 2014-11-07 10:53:06 +0000
comments: true
author: michael
categories: linux
tags:
 - apache
 - fedora
 - linux
 - selinux
 - mysql
description: Connecting to a mysql database when using SELinux
---

SELinux can be restrictive by defult but prevent alot of security issues. One thing we found while trying it is that by default it will block network connections from being made via the httpd daemon. This is an issue if say on a development system you are running php via the apache module.

To resolve this simply login via root or sudo to root privilige and run the following command:
    setsebool -P httpd_can_network_connect on
You should now be able to connect to connect to your database. This will also enable things like web api, curl calls and other php that requires network access.
