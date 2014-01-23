---
layout: post
title: "Octopress auto building the site locally for one blog post"
date: 2013-12-03 17:47:30 +0000
comments: true
author: kenneth
categories: 
 - Octoress
tags: 
 - octopress
 - github
 - blog
description: "Octopress auto building the site locally for one blog post"
---

Setting up a blog post using Octopress involves writing up your Markdown content, building the site, and previewing it.

This can be time-consuming when writing posts, having to run several commands repeatedly. Here's a few lines you can put into a bash script and run once each time:

``` bash

#!/bin/bash

PATHTOLATEST=`ls -t source/_posts | head -1`;
echo $PATHTOLATEST
bundle exec rake isolate[$PATHTOLATEST];
bundle exec rake generate;
bundle exec rake preview;

```

1. The PATHTOLATEST variable finds the latest post
- echo the variable for debugging purposes
- rake isolate instructs octopress to build the site with only the latest blog post
- rake generate builds the site
- rake preview initialises the web server

From then you can make changes to your post, and the site will be automatically regenerated. This uses a file watcher so it's helpful to keep the terminal open to watch for it building, or having errors
