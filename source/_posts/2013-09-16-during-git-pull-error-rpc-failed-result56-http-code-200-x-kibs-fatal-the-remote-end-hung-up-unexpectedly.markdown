---
layout: post
status: publish
published: true
title: 'During git pull: error: RPC failed; result=56, HTTP code = 200 [x] KiB/s       fatal:
  The remote end hung up unexpectedly'
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4521
wordpress_url: http://www.edmondscommerce.co.uk/?p=4521
date: 2013-09-16 15:07:54.000000000 +01:00
categories:
- git
tags:
- git
- error
- git pull
- bitbucket
---
If you receive this series of errors during a git pull (after the Receiving Objects stage):

```

$ git pull
Password for 'https://xxxxxxxxxx@bitbucket.org': 
remote: Counting objects: 1011, done.
remote: Compressing objects: 100% (394/394), done.
error: RPC failed; result=56, HTTP code = 200 51 KiB/s      
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

```

a quick solution is to use ssh to pull rather than the https protocol

Hope this helps
