---
layout: post
status: publish
published: true
title: Force a Bash Script to run in Screen
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2823
wordpress_url: http://www.edmondscommerce.co.uk/?p=2823
date: 2012-01-10 13:13:59.000000000 +00:00
categories:
- linux
tags:
- linux
- bulk
- bash
- script
- check
- screen
- process
---
If you create a bash script for a long running process then you may decide its much better, or even essential, that this script is run using screen.

Screen is a utility that allows you to run things in a detachable terminal on the server, so you are not reliant on your own machine maintaining a ssh connection to the server.

A nice trick here is to check if a script is running in screen and die if not

```

echo "Running Process in separate screen"

if [ -n "$STY" ];
then
        echo 'We are inside screen';
else
        echo "Not in a screen, please run with screen"
        exit 1
fi


```
