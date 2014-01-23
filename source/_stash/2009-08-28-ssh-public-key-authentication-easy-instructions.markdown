---
layout: post
status: publish
published: true
title: SSH Public Key Authentication Easy Instructions
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1171
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1171
date: 2009-08-28 15:32:40.000000000 +01:00
categories:
- hosting
tags:
- ssh
- public
- private
- key
- tutorial
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Just thought I would drop a quick blog and link to this nice succinct guide for setting up SSH to be able to log in via public key.

<a href="http://www.petefreitag.com/item/532.cfm">SSH public key tutorial</a>

Using public keys offers you a more secure way of logging into an SSH server and also opens up the possiblity of being able to log into an SSH server without entering your password. This is less secure of course but allows easier remote scripted SSH.

For example you can set up a user account on your server with limited permissions and then on a remote machine set up public key login capabilites and cron an rsync script to maintain a mirror image of your server without the need for any user intervention.
