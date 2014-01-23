---
layout: post
status: publish
published: true
title: Keep ssh alive
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2735
wordpress_url: http://www.edmondscommerce.co.uk/?p=2735
date: 2011-11-18 15:05:20.000000000 +00:00
categories:
- linux
tags:
- ubuntu
- linux
- problem
- server
- bash
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Due to our load-balancing router being a little "harsh" on closing connections that appear to be unused, ssh often sits and hangs.

Using a standard ssh config option though we can set a server keep-alive (on the ssh client, which also keeps sshfs alive)

In the "~/.ssh/config" file, simply adding the following keeps the connection sending a small packet every 30 seconds :-
<code>ServerAliveInterval=30</code>

I'm sure windows clients like puTTY also have a similar option, and on a mac, it should be the same file as Linux.
