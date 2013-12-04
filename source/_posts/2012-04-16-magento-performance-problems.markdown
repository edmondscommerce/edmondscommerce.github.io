---
layout: post
status: publish
published: true
title: Magento Performance Problems
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3083
wordpress_url: http://www.edmondscommerce.co.uk/?p=3083
date: 2012-04-16 08:56:48.000000000 +01:00
categories:
- magento
tags:
- performance
- html
- linux
- magento
- server
- apache
- configuration
- list
- block
- caching
- tip
- sysadmin
- apc
- opcode
- varnish
---
If you are having performance issues with your Magento store and you are running on a dedicated or VPS server that you think should be up to the task of running your store properly but you continue to have performance problems then this post is for you.

Having decent server specification is only the first step on the road to having a high performance Magento store. Without proper configuration your server is not going to make the best use of its resources and that could make the difference of literally seconds or even tens of seconds of page load time.

The first and most important thing to check is that you are running a PHP opcode cacher such as APC. Opcode caching takes your PHP source code and compiles it to opcodes and then stores this in a cache. This opcode is actually what is run when people visit your store and the process of creating it, especially if you have a very large application with lots of file (like Magento), can be a real performance bottleneck. This problem is easily resolved by having APC installed and configured. If you are not sure, ring your hosting company and find out and if you don't have it running, ask them to set it up for you.

The next thing to check is MySQL configuration. The standard MySQL configuration defaults were set when server hardware and memory was a tiny fraction of what it is today and that means that the configuration is generally way too sparse with allocation of memory for caching and other optimisations. Tweaking MySQL can be a little tricky, its definitely not something you should do if you are not sure, but it is well worth getting someone to optimise your MySQL configuration.

After that, the next major performance gain with Magento is to make proper use of block caching. Magento has a brilliant built in feature where every block (page section) can be cached so that next time someone visits the page, the logic used to generate that section of page (for example a best sellers list) does not have to be run, we simply redisplay the cached copy of that block's HTML.

Beyond these three steps there are still many more things that can be done to improve the performance of your Magento store. If you would like professional help getting the best out of your server and Magento with a view to getting the lowest possible page load speeds then get in touch with Edmonds Commerce today.
