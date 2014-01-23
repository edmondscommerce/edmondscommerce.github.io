---
layout: post
status: publish
published: true
title: Increase the Stabilty of your Magento cron
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3341
wordpress_url: http://www.edmondscommerce.co.uk/?p=3341
date: 2012-08-24 13:51:04.000000000 +01:00
categories:
- magento
tags:
- php
- linux
- magento
- cron
- extensions
- tip
- crontab
- eerp
---
Sometimes when your cron process in Magento seems to not be working it is worth doubling up the ways it gets executed.

One reason for this is various extensions (notably EERP from boostmyshop) set up an override to ensure that the same cron task is not run a second time if it's still running when the first run happens.

Often the cli setup for php is not configured with the same timeouts etc. that the web setup is.  Therefore one thing that can make your cron more "stable" is to use wget or curl to fetch the cron.php file rather than (or as well as) running the cron.sh script.

Here's what to add to the server's crontab (/etc/crontab or crontab -e) to use wget to fire off the cron :
```

* * * * * /usr/bin/wget -O- www.mycoolsite.com/cron.php > /dev/null 2> /dev/null

```

That of course needs the url changing to match your domain.  It's worth noting that having output and stderror piped to /dev/null in a crontab is probably not the best practice but given that any module can create cron tasks that output stuff, your sysadmin might dislike getting that emailed to them!
