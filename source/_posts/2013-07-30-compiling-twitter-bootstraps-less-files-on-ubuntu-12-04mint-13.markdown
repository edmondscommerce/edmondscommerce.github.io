---
layout: post
status: publish
published: true
title: Compiling Twitter Bootstrap's less files on Ubuntu 12.04/Mint 13
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4450
wordpress_url: http://www.edmondscommerce.co.uk/?p=4450
date: 2013-07-30 15:57:06.000000000 +01:00
categories:
- less css
tags:
- ubuntu
- less css
- mint
- less
- lessc
- bootstrap
---
The version of lessc available in Ubuntu 12.04's repositories is now out of date, stuck on version 1.2. When attempting to compile the bootstrap.less file to a proper CSS file, you'll find it complaining with the following error:
```

NameError: #grid > .core is undefined in /path/to/folder/less/bootstrap.less

```

This is due to your lessc version being outdated, but with Ubuntu 12.04/Mint 13, lessc 1.3+ isn't available in the repositories. You'll also have issues because nodejs itself is outdated too.

To update both issue the following commands:

```bash

sudo apt-get update
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

sudo apt-get autoremove node-less
sudo npm install -g less

```

(Source: <a href="http://askubuntu.com/questions/272780/ubuntu-12-10-lessc-1-3-3-installation" target="_blank">Ask Ubuntu</a>)
