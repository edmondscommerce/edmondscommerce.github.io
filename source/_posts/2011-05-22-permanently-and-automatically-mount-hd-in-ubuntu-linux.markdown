---
layout: post
status: publish
published: true
title: Permanently and Automatically Mount HD in Ubuntu Linux
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2264
wordpress_url: http://www.edmondscommerce.co.uk/?p=2264
date: 2011-05-22 21:19:48.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- linux
- auto
- mount
- ftab
- mtab
- drive
- hard
- automatically
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you have a secondary hard drive that you have to manually mount in Ubuntu/Linux everytime you boot up and you are not too comfortable with the syntax for fstab, this is a possible easy shortcut for you.

You can view the currently mounted partitions by looking at mtap

```

cat /etc/mtab

```

If you do this after you have mounted the drive, you can see the full mount command that has been used, eg

```

/dev/sdc1 /media/BigDrive ext4 rw,nosuid,nodev,uhelper=udisks 0 0

```

You can copy that line and paste it into your fstab and from then on when you boot up the drive will be mounted automatically.

```

sudo gedit /etc/fstab

```

I have no idea what all that stuff means and to be honest I don't care I just want to use my hard drive.

ALWAYS back up your fstab before making changes!

Hope that helps ;)
