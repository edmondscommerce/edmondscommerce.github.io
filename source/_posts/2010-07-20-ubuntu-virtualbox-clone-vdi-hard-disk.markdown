---
layout: post
status: publish
published: true
title: Ubuntu VirtualBox Clone VDI / Hard Disk
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1737
wordpress_url: http://www.edmondscommerce.co.uk/?p=1737
date: 2010-07-20 17:35:07.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- virtualbox
- clone
- vdi
- hd
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are using VirtualBox in Ubuntu for your virtual machine requirements, some times you might decide that you want to clone a machine so that you can have different versions of the OS (perhaps running different browser versions for example).

To clone the VDI you need to first of all completely shutdown the virtual machine.

Then you need to go to File->Virtual Media Manager and Release the VDI that you want to clone.

Next you need to open a terminal and type:

```

cd ~/.VirtualBox/HardDisks/

```

You need to figure out which VDI you want to clone (lets assume xp.vdi).

Next you need to run this command:

```

VBoxManage clonehd xp.vdi cloned_xp.vdi

```

Now back into the VirtualBox GUI, you need to go back to the Virtual Media Manager and click the Add icon and add your newly created cloned VDI.

Then you create a new VM as normal, but when you get to the Hard Disk part of the wizard, select the use existing hard disk option and select your new VDI.
