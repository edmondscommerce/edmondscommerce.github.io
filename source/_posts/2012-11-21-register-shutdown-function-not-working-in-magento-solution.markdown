---
layout: post
status: publish
published: true
title: Register Shutdown Function not Working in Magento + Solution
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3683
wordpress_url: http://www.edmondscommerce.co.uk/?p=3683
date: 2012-11-21 20:07:40.000000000 +00:00
categories:
- magento
tags:
- development
- php
- problem
- solution
- debugging
- tip
---
I am currently putting together an automated system that converts user input within Magento. 

As this runs using cron, I will be unable to see if anything goes wrong, unless the errors are logged.

Now it is possible to set custom error and exception handlers that will log most things, but I needed to cover all bases and try to log in the event of a fatal error.

It is possible to do this by calling register_shutdown_function and checking for an error there - see <a href="http://stackoverflow.com/questions/277224/how-do-i-catch-a-php-fatal-error" title="Stack Overflow - How do I catch a PHP Fatal Error">here</a> for a full explanation on how to do this.

The problem I had was that this would not work within Magento. After a lot of going through the code it appears that if you have developer mode set to true, then your function will not be called. Once it is disabled the function works as expected.
