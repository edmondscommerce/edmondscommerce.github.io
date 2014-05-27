---
layout: post
title: "Using Apache JMeter For Load Testing"
date: 2014-05-27 13:01:39 +0100
comments: true
author: joseph
tags: 
- load
- linux
- optimisation
- server
- performance
- testing
categories: 
- load testing
description: "Using Apache JMeter to Load Test your Web Site"
---

Load testing is something that you really need a decent solution for. A simple tool such as Apache Bench (ab) is overly simplistic for todays web applications. 

After some research I decided to use Apache Jmeter as the tool of choice. It is written in Java so easy enough to run on any platform.
It features a GUI which is ideal for creating your tests, then a command line version which is what you should use to run your tests.

For my purposes I wanted to feed in a large list of URLs, for that I followed these instructions:
[http://asciiville.com/musings/coder/how-to-feed-jmeter-from-csv](http://asciiville.com/musings/coder/how-to-feed-jmeter-from-csv)

This allows you to create a csv file with your choice of URLs. It was actually quite hard to find a decent and succint guide to getting this set up but thankfully that page fitted my requirements.

Once I started to run the test I quickly realised that my system was grinding to a halt with out of memory errors. A bit more searching yielded this page which advises on how to properly run Jmeter including the fact that you really should run it on the command line for proper testing. 
[http://blazemeter.com/blog/jmeter-performance-and-tuning-tips](http://blazemeter.com/blog/jmeter-performance-and-tuning-tips)
