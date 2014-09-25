---
layout: post
title: "URGENT update BASH - big security issue"
date: 2014-09-25 15:18:14 +0100
comments: true
author: joseph
categories: 
- security
tags: 
- BASH
- linux
- security
- shellshock
description: "ShellShock is a newly discovered Linux exploit affecting BASH. Unfortunately this will affect most servers and is a critical flaw. Update your server ASAP"
---

Shell Shock is a BASH exploit that can allow the running of arbitrary commands on Linux servers. 

This is a newly discovered bug and affects a very large number of servers. 

There is a patch, you should ensure that your server's BASH version is updated ASAP.

### Centos, Redhat etc
```
yum clean all; yum -y update bash
```

###Ubuntu, Debian etc
```
apt-get install --only-upgrade bash
```


To check if you are vulnerable, you can run this code:

```
env X="() { :;} ; echo VULNERABLE" /bin/sh -c "echo completed"
```


If you see VULNERABLE then you need to update BASH.


