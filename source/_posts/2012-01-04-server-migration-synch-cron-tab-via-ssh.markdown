---
layout: post
status: publish
published: true
title: Server Migration - Synch Cron Tab via SSH
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2788
wordpress_url: http://www.edmondscommerce.co.uk/?p=2788
date: 2012-01-04 17:54:14.000000000 +00:00
categories:
- linux
tags:
- linux
- server
- migration
- ssh
- cron
- crontab
- resynch
- synch
---
If you are handling a server migration and would like to have a scripted way to copy the crontab from one machine to the other then you might like this little snippet.

```


ssh -p2020 root@123.123.123.123 'crontab -l' | crontab -


```

This will get the contents of the root crontab from one server and apply it to the current server, replacing any current cron tab settings.

This is nice if you want to have a repeatable server resynch process whilst you are migrating and the crontab on the old server may change
