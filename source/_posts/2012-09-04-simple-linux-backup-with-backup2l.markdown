---
layout: post
status: publish
published: true
title: Simple Linux Backup with Backup2L
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3371
wordpress_url: http://www.edmondscommerce.co.uk/?p=3371
date: 2012-09-04 13:25:55.000000000 +01:00
categories:
- linux
tags:
- linux
- backup
- bash
- backup2l
- incremental
- backups
---
If you have incremental backup requirements but would rather avoid something heavy and perhaps over featured and complex such as <a href="http://www.bacula.org/en/" target="_blank">Bacula</a> then <a href="http://backup2l.sourceforge.net/" target="_blank">Backup2L</a> could be just the thing.

Written in BASH, it comprises only a small number of files that you can read directly to see how it works.

There is a configuration file that is installed to /etc/backup2l which you will need to edit a little and then after that its just a case of running 
```bash

backup2l -b 

```

to initiate your backups.

If you need to restore something the process is just 

```bash

backup2l --restore [file_grep]

```

Where the file grep is a pattern to find the files you need.

It is actually very simple to set up, just hit the man page.
