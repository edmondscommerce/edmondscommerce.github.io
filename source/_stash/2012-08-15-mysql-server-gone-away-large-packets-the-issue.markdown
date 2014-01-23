---
layout: post
status: publish
published: true
title: MySQL Server Gone Away - Large Packets the Issue?
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3268
wordpress_url: http://www.edmondscommerce.co.uk/?p=3268
date: 2012-08-15 12:58:23.000000000 +01:00
categories:
- mysql
tags:
- mysql
- problem
- server
- error
- solution
- maria
- gone
- away
- my.cnf
- max
- allowed
- packet
---
If you are scratching your head trying to figure out why you keep getting MySQL server gone away error messages despite the fact you have bumped up all the timeout etc configurations to high values then this could be your solution.

MySQL will also give you this error if you try to send a packet that is larger than the packet size defined. We had an application that was using MariaDB which has a default max allowed packet of 16M by default.

The application in question was sending large amounts of data to be stored and so the solution to the gone away issues was simply to increase the max_allowed_packet configuration in my.cnf, restart the mysql daemon and the problems are sorted.
