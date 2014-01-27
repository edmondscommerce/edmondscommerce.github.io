---
layout: post
status: publish
published: true
title: Magento Events Cheat Sheet Grep - Works for Any Version
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1403
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1403
date: 2010-02-20 10:46:01.000000000 +00:00
categories:
- magento
tags:
- magento
- grep
- cheatsheet
- events
- dispatchevent
---
If you use the Magento event / observer system for extending Magento (if you don't you should) then you will find this little script handy for parsing out all of the events in the latest (eg Magento 1.4) version of Magento.

This is a Linux shell script so either use it on your server or if you run a decent desktop OS you should be able to run it on your desktop. 

There are two parameters you need to define.

```

#!/bin/bash
# Find all Magento Events, include file names, line numbers and the preceding 6 lines of code

#Please define these two
ABSOLUTE_PATH_TO_MAGENTO_ROOT=/home/joseph/Projects/Magento/
ABSOLUTE_PATH_TO_OUTPUT_FILE_INC_FILE_NAME= /home/joseph/magentoEvents.txt

#here is the command
find $ABSOLUTE_PATH_TO_MAGENTO_ROOT  -name "*.php" | xargs -L10 grep -n -B 6 "dispatchEvent" . > $ABSOLUTE_PATH_TO_OUTPUT_FILE_INC_FILE_NAME

# save this file as magentoevents.sh
# then do command: chmod +x magentoevents.sh
# then to run, do command: ./magentoevents.sh


```
