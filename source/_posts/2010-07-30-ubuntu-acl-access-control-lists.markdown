---
layout: post
status: publish
published: true
title: Ubuntu ACL Access Control Lists
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1756
wordpress_url: http://www.edmondscommerce.co.uk/?p=1756
date: 2010-07-30 09:37:15.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- linux
- permissions
- acl
- access
- control
- list
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are working in Linux and need to set some more complex permissions than the straight user, group everyone RWX style, then you can.

Working in Ubuntu, you need to first of all install ACL

```

sudo apt-get install acl

```

Now before you can use ACL, you need to enable it on whichever volumes you want to use it on. To do this you have to edit your fstab (which if you do it wrong can cause problems so make sure you back it up!)

In the options column of the fstab for the volume you are working with, you need to add acl, eg:

```

/dev/mapper/server-root /               ext4    errors=remount-ro 0 

```
becomes
```

/dev/mapper/server-root /               ext4    acl,errors=remount-ro 0 

```

Now you need to remount

```

mount -o remount /

```

Now you need to check acl is working:

```

mount | grep acl

```

you should see a line with acl in there

Now to recursively set an ACL for a particular user giving full access on a folder structure, use this command:

```

setfacl -Rm u:user:rwX,d:u:user:rwX /path/to/folder

```

To fully understand ACL, hit the man pages

```

man acl

```

