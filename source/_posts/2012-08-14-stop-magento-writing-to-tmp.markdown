---
layout: post
status: publish
published: true
title: Stop Magento writing to /tmp
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3243
wordpress_url: http://www.edmondscommerce.co.uk/?p=3243
date: 2012-08-14 13:54:17.000000000 +01:00
categories:
- magento
tags:
- development
- linux
- magento
- symlink
- bash
- tip
- syadmin
- trick
---
So some of us disagree when it comes to what should happen when magento cannot write to var/ in the webroot.  Magento itself chooses to try /tmp/magento/ if the var/ folder is not writable.  This can cause many issues and confusion.  Not least of which emptying var/ and making it writable does not make magento start using it, if there's already a /tmp/magento!

One preferable option is to force magento to just stop if it can't write to var/ - here's a simple way to do this, which is sneaky but really handy :-
```bash

cd /tmp
ln -s abracadabra-dangling-symlink magento

```

What that does is create a dangling symlink in /tmp/ called magento, which cannot be overwritten by a directory.  Magento then simply stops.  Stopping because of permissions errors is often preferable to continuing and causing later confusion and problems.
