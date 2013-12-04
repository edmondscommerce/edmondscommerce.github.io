---
layout: post
status: publish
published: true
title: 'SQLSTATE[28000]: Invalid authorization specification: 1045 Access denied for
  user + Solution'
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3931
wordpress_url: http://www.edmondscommerce.co.uk/?p=3931
date: 2013-02-12 18:03:29.000000000 +00:00
categories:
- mysql
tags:
- mysql
- development
- problem
- solution
- debugging
- tip
---
I have recently been running some MySql scripts that wrote to a file. 

These worked fine locally, but as soon as I deployed them I started to get the error above.

After much looking around I came across this solution.

When I was developing locally, I was connecting with a user that had global privileges. When I was running the code on the server I was connecting with a user that only had privileges for the database I was using.

The issue is that then FILE privilege is a Global setting, so the user did not have access to it, hence the access denied message. 

Grant FILE privileges and you can connect as expected
