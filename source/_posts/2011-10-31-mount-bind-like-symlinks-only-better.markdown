---
layout: post
status: publish
published: true
title: Mount --bind - like symlinks only better!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2700
wordpress_url: http://www.edmondscommerce.co.uk/?p=2700
date: 2011-10-31 16:38:13.000000000 +00:00
categories:
- linux
tags:
- ubuntu
- custom
- mount
- fstab
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you use Linux on a regular basis, you'll probably know just how useful a symlink is.

This makes things extremely annoying when a program refuses to work with them - treats them as a file or just refuses to work.

Enter: <strong>mount --bind</strong>

mount --bind is a special type of mount that will mount one directory as a child of another.  Quite often this is used for simplifying partitioning or if a cpanel server runs out of disk space.

The general usage at the commandline is :-
<code>mount --bind olddir newdir</code>

and in the fstab :-
<code>olddir	newdir		none	defaults,bind	0	0</code>

For instance, setting up a system where /home, /var and /opt share a partition and everything else is on another can be done like this in your fstab :-
<code>
#root fs
UUID=ebb8043d-6f1e-4a65-8d73-2c05f7ec213a /               xfs     defaults        0       1
#two tibibyte partition
UUID=6210e43f-83a3-4001-83c7-40e3b1fb9c8e /twotib         xfs     defaults        0       2
# Following binds
/twotib/home	/home		none	defaults,bind	0	0
/twotib/opt	/opt		none	defaults,bind	0	0
/twotib/var	/var		none	defaults,bind	0	0
</code>
