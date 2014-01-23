---
layout: post
status: publish
published: true
title: Netbeans + Xdebug Not Highlighting Lines or Opening Files when Step Through
  Debugging + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2691
wordpress_url: http://www.edmondscommerce.co.uk/?p=2691
date: 2011-10-14 10:27:39.000000000 +01:00
categories:
- php
tags:
- php
- problem
- server
- netbeans
- path
- solution
- debugging
- xdebug
- remote
- local
- project
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you use Netbeans along with Xdebug to facilitate step through debugging when coding PHP then you may come across this issue.

It's possible to get it into a semi working scenario where you can have working breakpoints and see variable values but you have no idea which bit of code you are actually stepped up to.

This can happen if your server path and project path are not correctly configured.

To resolve this simply go to your project properties, run configuration and then hit the advanced button.

The server path should be the absolute path to the project root on the server (eg /home/server/sites/blah/) and the project path should be the path on your local machine to the project files (eg /home/joseph/projects/blah/).

Stop any debugging sessions and then start another one up and if you have the paths set right, you should get the behaviour you expect where Netbeans highlights the current line of code and allows you to step through the code to figure out what's going on.
