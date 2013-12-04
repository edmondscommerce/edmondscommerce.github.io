---
layout: post
status: publish
published: true
title: 'Linux Bash Scripting: Force Screen if not Cron Task'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3357
wordpress_url: http://www.edmondscommerce.co.uk/?p=3357
date: 2012-08-30 09:27:16.000000000 +01:00
categories:
- linux
tags:
- linux
- ssh
- cron
- bash
- terminal
- script
- long
- tip
- scripting
- task
- screen
- force
- running
---
If you have a long running script that is designed to run as cron but may be run manually from the terminal then you may want to enforce screen so that the process can't be aborted by the SSH terminal being closed for whatever reason.

We already blogged about how to <a href="http://www.edmondscommerce.co.uk/linux/force-a-bash-script-to-run-in-screen/" title="Linux Force Screen">force running as screen here</a>.

This is an extension of this that also checks for running as Cron and if so, does not force screen.

```bash

# First off, ensure running from Cron and if not, Screen
if [ -t 1 ]
then
    echo &quot;Not running as Cron Task&quot;
    if [ -n &quot;$STY&quot; ];
    then
        echo 'We are inside screen, good';
    else
        echo &quot;Not in a screen, please run with screen&quot;
        echo &quot;Exiting&quot;
        exit 1
    fi
else
    echo &quot;Running as Cron Task&quot;
fi

```

Simply paste this somewhere close to the top of your script before it does anything and this will work nicely.
