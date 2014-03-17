---
layout: post
title: "Using Pipe Viewer for an Easy CLI Progress Bar"
date: 2014-03-17 14:58:14 +0000
comments: true
author: joseph
categories: 
 - linux
tags: 
 - linux
 - pipe
 - pipeviewer
 - progressbar
description: "Using pipeviewer to get an easy progress bar for long running processes such as db imports"
---
If you have a large database file to import or any other longer running process that involves piping data from one place to another then this little utility should definitely be in your arsenal.

Simply enough you use this to give you a progress indication when you are piping large amounts of data.

To use this on a mysql import (which is where I am most likely to use this) you would do the following:

``` bash 
pv ./dumpfile.sql | mysql -u$USER -p$PASS dbname
```

This will then give you a simple progress bar and very usefully, an ETA that indicates how much time is left For example:
```
 308MB 0:07:57 [ 216kB/s] [===============>                                          ] 10% ETA 1:08:32
```

To install the utility you should first of all just try `yum install pv`. If that doesn't work then you can read more about installing for your distribution here:
http://www.ivarch.com/programs/pv.shtml


