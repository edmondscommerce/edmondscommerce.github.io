---
layout: post
status: publish
published: true
title: Cron not Working in Magento +Solution
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3625
wordpress_url: http://www.edmondscommerce.co.uk/?p=3625
date: 2012-11-13 16:34:33.000000000 +00:00
categories:
- magento
tags:
- problem
- magento
- cron
- solution
- bash
- helpful tips
---
I recently had a Magento store that was not running cron jobs despite everything appearing to be set up correctly. 

After tearing out my hair, I discovered that there was a cron job running that had not closed properly, which prevented any new cron jobs from starting.

This is because the cron.sh file that is used by magento checks the currently running processes, and if one exists quietly exits.

To check if this is the case you can run a modified line from the cron.sh file as set out below

<code>
ps auxwww | grep "/path/to/magento/cron.php" | grep -v grep | grep -v cron.sh
</code>

If this returns a line similar to the one below

<code>
root      2125  0.0  0.9 329896 40484 ?        S    Nov13   0:00 /usr/bin/php /path/to/magento/cron.php
</code>

You can kill the running job, which will allow cron to run normally. At this stage you should debug the cron tasks to see why the process stalled
