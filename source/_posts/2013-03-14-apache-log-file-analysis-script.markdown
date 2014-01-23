---
layout: post
status: publish
published: true
title: Apache Log File Analysis Script
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4142
wordpress_url: http://www.edmondscommerce.co.uk/?p=4142
date: 2013-03-14 14:17:48.000000000 +00:00
categories:
- bash
tags:
- performance
- server
- apache
- file
- bash
- log
- script
- tip
- analysis
- bot
- bad
- scraper
---
Here is a little bash script we knocked together to track down some malicious activity on a clients server.

Using a bit of awk etc to parse the log files we could quickly track down an IP address that was overloading the server and then take steps to block that person.

Here is the script:

```bash

#!/bin/bash

###### SETUP ############
LOG_FOLDER=/var/www/vhosts/domain.co.uk/statistics/logs
ACCESS_LOG=$LOG_FOLDER/access_log

HOW_MANY_ROWS=20000



######### FUNCTIONS ##############


function title() {
    echo "
---------------------------------
$@
---------------------------------
"
}

function urls_by_ip() {
    local IP=$1
    tail -5000 $ACCESS_LOG | awk -v ip=$IP ' $1 ~ ip {freq[$7]++} END {for (x in freq) {print freq[x], x}}' | sort -rn | head -20
}


function ip_addresses_by_user_agent(){
    local USERAGENT_STRING="$1"
    local TOP_20_IPS="`tail  -$HOW_MANY_ROWS $ACCESS_LOG | grep "${USERAGENT_STRING}"  | awk '{freq[$1]++} END {for (x in freq) {print freq[x], x}}' | sort -rn | head -20`"
    echo "$TOP_20_IPS"
}

####### RUN REPORTS #############


title "top 20 URLs"
TOP_20_URLS="`tail -$HOW_MANY_ROWS $ACCESS_LOG | awk '{freq[$7]++} END {for (x in freq) {print freq[x], x}}' | sort -rn | head -20`"
echo "$TOP_20_URLS"


title "top 20 URLS excluding POST data"
TOP_20_URLS_WITHOUT_POST="`tail  -$HOW_MANY_ROWS $ACCESS_LOG | awk -F"[ ?]" '{freq[$7]++} END {for (x in freq) {print freq[x], x}}' | sort -rn | head -20`"
echo "$TOP_20_URLS_WITHOUT_POST"


title "top 20 IPs"
TOP_20_IPS="`tail  -$HOW_MANY_ROWS $ACCESS_LOG | awk '{freq[$1]++} END {for (x in freq) {print freq[x], x}}' | sort -rn | head -20`"
echo "$TOP_20_IPS"

title "top 20 user agents"
TOP_20_USER_AGENTS="`tail  -$HOW_MANY_ROWS $ACCESS_LOG | cut -d\  -f12- | sort | uniq -c | sort -rn | head -20`"
echo "$TOP_20_USER_AGENTS"


title "IP Addresses for Top 3 User Agents"

for ((I=1; I<=3; I++))
do
    UA="`echo "$TOP_20_USER_AGENTS" | head -n $I | tail -n 1 | awk '{$1=""; print $0}'`"
    echo "$UA"
    echo "~~~~~~~~~~~~~~~~~~"
    ip_addresses_by_user_agent "$UA"
    echo "
    "
done


```



