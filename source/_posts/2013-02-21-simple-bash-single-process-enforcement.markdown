---
layout: post
status: publish
published: true
title: Simple Bash Single Process Enforcement
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3985
wordpress_url: http://www.edmondscommerce.co.uk/?p=3985
date: 2013-02-21 15:06:39.000000000 +00:00
categories:
- bash
tags:
- magento
- cron
- shell
- bash
- script
- tip
- process
- trick
- single
- enforce
- ps
- waux
---
If you have a bash script that you want to make sure there is only ever one instance of, for example something triggered by cron that might not have finished the next time cron tries to trigger it then you might like this little snippet:

This is built for running Magento shell scripts (if you don't know about these, check them out) that are run on cron.

Also note the logging that keeps log files 

Note the use of a character class in grep means it wont match itself - nice eh :)

```bash

#!/bin/bash
HOUR=`date +'%H:%M'`
RUNNING=`ps waux | grep "longrunner[.]php"`
if [ "" == "$RUNNING" ]
then
    echo "Its not running, we can now run it"
    php -f /home/my/public_html/shell/longrunner.php -- import > /home/my/public_html/var/log/mylog.txt 2>&1
    cp -f  /home/my/public_html/var/log/my.txt /home/my/public_html/var/log/${HOUR}.my.txt
    echo "COMPLETED"
else
    echo "It is running, aborting running this time"
fi

```
