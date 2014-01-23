---
layout: post
status: publish
published: true
title: 'Tip: Should have run that in screen? now you can!'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3110
wordpress_url: http://www.edmondscommerce.co.uk/?p=3110
date: 2012-05-24 15:00:27.000000000 +01:00
categories:
- linux
tags:
- ubuntu
- linux
- developer
- solution
- command line
- bash
- terminal
- script
- tip
---
Ever started a long process running that you thought wouldn't take long and then thought "I should have run that in screen"?

Well, thanks to an ingenious programmer, you can actually do that!

The app is called reptyr, is at <a href="https://github.com/nelhage/reptyr">https://github.com/nelhage/reptyr</a> and there's a ubuntu ppa <a href="https://launchpad.net/~broder/+archive/reptyr">here</a> Note: I compiled from scratch as the ppa didn't seem to work for me.

So, all you need to do is open a terminal (press Ctrl-Z to stop the task if you only have one and don't want to open a new one), run screen (or tmux etc) and type "reptyr 1234" where 1234 is the process id (pid) of the program to pull to your current terminal.  To get the pid, "ps waux" usually gives all the info you need to identify it.
