---
layout: post
title: "SELinux Configuration for Alternative Document Root"
date: 2014-10-04 12:19:52 +0100
comments: true
author: joseph
categories:
- linux
tags: 
 - apache
 - fedora
 - linux
 - selinux
description: “How to grant read write access for Apache and PHP when using an alterntive document root”
---
SELinux provides a secure and fine grained way of controlling permissions for applications running on Linux. It moves beyond simple users and groups to something a lot more granular.

By default SELinux is configured expecting Apache to be using /var/www as its document root.

If you are using an alternative document root then you might find that Apache is unable to write to folders, even though permissions are correctly configured.

If this is the case, you might think that you should disable SELinux, however a better solution is to correctly configure it.

First of all you should double check what types http has:

``` bash
semanage fcontext -l | grep http
```

We specifically need read/write access so lets grep for that:

``` bash
semanage fcontext -l | grep http | grep rw
```

For me that shows the type: httpd_sys_rw_content_t

We now need to add this to our custom document root:

```bash
semanage fcontext -a -t httpd_sys_rw_content_t ‘/opt/Projects(/.*)?’
restorecon -R -v /opt/Projects/
```
And then you should be able to run your sites from any folder you like without having to resort to disabling SELinux
