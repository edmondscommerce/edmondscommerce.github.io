---
layout: post
status: publish
published: true
title: Apache Access Logs Find Spiders by Counting Requests to IP Addresses
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3297
wordpress_url: http://www.edmondscommerce.co.uk/?p=3297
date: 2012-08-21 13:24:37.000000000 +01:00
categories:
- linux
tags:
- security
- spider
- linux
- apache
- bash
- access
- block
- log
- examine
- whois
- bot
- robot
- bad
---
If you would like a quick summary of the IP addresses that are beating the **** out of your server by firing lots of requests for quite possibly malicious or otherwise nefarious reasons then try this little bash script:

```bash

#!/bin/bash
LOG_FILE=/var/www/vhosts/DOMAIN.co.uk/statistics/logs/access_log
OUT_FILE=/tmp/spider_analysis

#This generates a file with the top 20 IP addresses by number of requests
cat $LOG_FILE | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 20 > $OUT_FILE

echo "Top 20 IP addresses by number of request"
cat $OUT_FILE

#allow for loop to split on new line
IFS_BAK=$IFS
IFS="
"

for i in `cat $OUT_FILE`
do
    COUNT=`echo $i | awk '{print $1}'`
    IP_ADD=`echo $i | awk '{print $2}'`
    echo ""
    echo "---------------------------------"
    echo ""
    echo "$IP_ADD has made $COUNT requests"
    echo "Whois Information"
    whois $IP_ADD 
    #lynx -dump http://who.cc/$IP_ADD # whois was blocked on the server i was using for some reason, use lynx as a work around
    echo ""
    echo "---------------------------------"
    echo ""
done

# set that back
IFS=$IFS_BAK
IFS_BAK=

```

You would use this to give you some idea of which IPs are hitting the server a lot.

Usually you would expect to see a lot of these being search engines which you likely want to allow. However if you see any domestic or other IP addresses then you may choose to block these.
