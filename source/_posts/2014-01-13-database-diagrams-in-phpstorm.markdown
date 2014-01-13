---
layout: post
title: "Database Diagrams in PhpStorm"
date: 2014-01-13 18:16:29 +0000
comments: true
author: ross
categories: php 
tags: 
  - php
  - development
  - database
  - phpstorm
description: "How to generate a database diagram with PhpStorm"
---
I've recently been handed a new project and wanted to get a better understanding of how everything was supposed to fit together.

As I'm using PhpStorm, I decided to try the built in tools to see how they work and what they can generate. 

To get these working you need to do a bit of set-up first, so the process is documented here:

There should be a Database option in the toolbar, click on this and then click the green cross -> Data Source and the Database engine you are using.

After this a new window will appear asking you to set-up the options needed to connect. Fill in the credentials that are required and then test the connection to ensure that everything is working correctly.

Once this has been done, the Database window should fill up with the different tables in you database. From here you can quickly see how each table is structured, browse the data that is there, bring up a console (Ctrl + Shift + F10) or generate a database diagram (Ctrl + Shift + Alt + U)
