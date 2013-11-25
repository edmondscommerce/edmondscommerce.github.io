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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
