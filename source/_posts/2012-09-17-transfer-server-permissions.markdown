---
layout: post
status: publish
published: true
title: Transfer Server Permissions
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3431
wordpress_url: http://www.edmondscommerce.co.uk/?p=3431
date: 2012-09-17 15:00:01.000000000 +01:00
categories:
- linux
tags:
- find
- linux
- server
- permissions
- bash
- tip
- sysadmin
- perl
---
So sometimes you might have a restored backup without the correct permissions (whether that be because the backup didn't store the permissions, the file system refused to take them, or you simply forgot to add the -p flag to tar!) and you want to copy the permissions from one machine to another.

Here's a little script to do just that that we found whilst browsing the internet to do just that (uses perl and find) :-
```bash

find / -type f -o -type d 2>/dev/null | while read FILE; do   perl -le'
    printf "chmod %o \"%s\"\n", 07777 & (stat)[2], $_
    for @ARGV
  ' "$FILE"; done > /tmp/file_perms.sh

```

If you run that on the server with the correct permissions, then transfer the file to the server with the wrong permissions and run the file with the following command, it will fix the perms on that server :-
```bash

sh /tmp/file_perms.sh

```

Which may save a lot of transfer time restoring a new backup.
