---
layout: post
status: publish
published: true
title: Side by Side diff on the command line
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4412
wordpress_url: http://www.edmondscommerce.co.uk/?p=4412
date: 2013-07-09 17:25:18.000000000 +01:00
categories:
- bash
tags:
- development
- linux
- solution
- bash
- script
- tip
---
I have recently discovered a handy trick when comparing files on the command line.

Adding the -y command line options to diff will display the files side by side.

Using this with the <a href="http://www.colordiff.org/" title="Color Diff" target="_blank">Color Diff</a> tool will help you transform this

{% img  /assets/normal-diff.png %}

To this

{% img  /assets/color-diff-600x200.png %}
