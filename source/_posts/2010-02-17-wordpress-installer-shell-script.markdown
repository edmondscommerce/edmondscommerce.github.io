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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
A nice little shell script for quickly install WordPress on Linux::

<code>#!/bin/bash
wget http://wordpress.org/latest.zip
unzip latest.zip
cp -rf ./wordpress/* ./</code>
