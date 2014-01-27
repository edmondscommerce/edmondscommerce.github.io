---
layout: post
status: publish
published: true
title: Ubuntu Auto Mount NTFS Drives at Boot
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1244
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1244
date: 2009-11-07 16:07:53.000000000 +00:00
categories:
- ubuntu
tags:
- ubuntu
- ntfs
- auto
- mount
- fstab
- ntfs-config
- pysdm
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If like me you have a Linux drive, but also run NTFS drives for windows/buntu compatability reasons (in my case, simply archive drives that I haven't got around to moving from NTFS to EXT).

After nuking my machine thanks to trying a variety of advice found on the net. (I don't recommend you use pySDM - it Killed my machine thanks a a user interface that allows you to select the drive you want to edit on the left pane, but actually you are still editing your main drive!)

In fact the final solution was really easy.

To automate mounting NTFS partitions in ubuntu, simply do the following:

1. Make sure no drives are currently mounted that you want to automate

2. Install NTFS-config
```
sudo apt-get install ntfs-config
```

3. Run NTFS-config
```
sudo ntfs-config
```

Select the drive you want to auto mount, tick all boxes 
