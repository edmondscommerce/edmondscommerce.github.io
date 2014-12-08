---
layout: post
title: "Bash Script to Kill Sleeping MySQL Processes"
date: 2014-12-08 12:52:03 +0000
comments: true
author: joseph
categories: 
 - bash
tags: 
 - mysql
 - bash
 - sleeping
description: "Here is a quick BASH script for you to quickly clear out sleeping MySQL processes over 1 second old"
---

Pretty much what is says on the tin, if for some reason you have a large amount of sleeping MySQL processes and you want to quickly clear them all out, this little BASH script will do the job.

I leave it to you to decide how to handle the DBUSER and DBPASS variables

``` bash
#!/bin/bash
mysql -u $DBUSER -p$DBPASS -e "
select 
-- * 
id
from information_schema.processlist 
where command = 'Sleep' 
and time > 1 
and host ='localhost'
" | while read id; 
do 
    if [[ "id" == "$id" ]]
    then
        continue
    fi
    echo "kill $id";
    mysql -u $DBUSER -p$DBPASS -e "kill $id";
done


```
