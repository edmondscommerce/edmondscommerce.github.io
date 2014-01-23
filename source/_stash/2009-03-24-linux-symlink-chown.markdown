---
layout: post
status: publish
published: true
title: Linux Symlink chown
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 263
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=263
date: 2009-03-24 13:35:08.000000000 +00:00
categories:
- linux
tags:
- linux
- symlink
- chown
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you create a symlink via SSH then chances are you are logged in as the root user and the symlink will be created as root. Usually though you will want to the symlink to belong to another owner:group.

If you try to use chown it will silently fail to change the ownership of the symlink, though instead it will change the ownership of the file the symlink is pointing to.

If you want to make it actually change the owner:group of the symlink, us the switch -h.

For example:

```

chown -h user:group symlink

```<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.epistasis.co.uk/?p=6" rel="nofollow">FreeBSD <b>chown</b> and chmod</a><br><a href="http://www.edmondscommerce.co.uk/blog/ecommerce/setting-up-amazons-amtu-on-a-linux-server/" rel="nofollow">Setting Up Amazon’s AMTU on a Linux Server | Edmonds Commerce Blog</a><br><a href="http://www.robertbolton.com/netbeans-subversion-and-symlinks" rel="nofollow">RobertBolton.com » NetBeans, Subversion and <b>Symlinks</b></a><br></div>
