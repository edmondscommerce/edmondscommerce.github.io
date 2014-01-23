---
layout: post
status: publish
published: true
title: CentOS Very Slow SSH Password Prompt
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2152
wordpress_url: http://www.edmondscommerce.co.uk/?p=2152
date: 2011-02-24 17:49:11.000000000 +00:00
categories:
- linux
tags:
- ssh
- slow
- centos
- login
- password
- prompt
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are finding it takes ages for a password prompt to come up when trying to connect to a CentOS server (and possibly others) this is a solution.

The cause is that your IP address does not have the correct reverse DNS etc settings.

You can of course try to fix all that but if you need a quick fix, you can edit the sshd configuration and disable

GSSAPIAuthentication yes

to: GSSAPIAuthentication no

and

UseDNS yes

to: UseDNS no
