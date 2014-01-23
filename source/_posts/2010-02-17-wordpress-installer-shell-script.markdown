---
layout: post
status: publish
published: true
title: WordPress Installer Shell Script
author: kenny
author_login: kenny
author_email: kenny@edmondscommerce.co.uk
wordpress_id: 1392
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1392
date: 2010-02-17 17:52:08.000000000 +00:00
categories:
- php
tags:
- wordpress
- shellscript
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
A nice little shell script for quickly install WordPress on Linux::

<code>#!/bin/bash
wget http://wordpress.org/latest.zip
unzip latest.zip
cp -rf ./wordpress/* ./</code>
