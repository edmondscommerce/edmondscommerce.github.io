---
layout: post
status: publish
published: true
title: Tab Complete for SSH and SCP
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4430
wordpress_url: http://www.edmondscommerce.co.uk/?p=4430
date: 2013-07-26 10:31:41.000000000 +01:00
categories:
- magento
- bash
tags:
- custom
- ssh
- shell
- bash
- tip
- helpful tips
---
If you are required to connect to different servers, then remembering and typing in all of the details can become tiresome.

Thankfully there is simple solution to this, using the SSH config file.

To make use of this, create the following file ~/.ssh/config

In there add the following details

```bash

Host easyToRememberName
    HostName 127.0.0.1
    Port 2020
    User ross

```

You will then can tab completion on ssh and scp commands. You can see more of the options that can be set in the file <a href="http://linux.die.net/man/5/ssh_config" title="ssh config man page">here</a>
