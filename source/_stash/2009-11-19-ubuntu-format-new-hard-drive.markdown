---
layout: post
status: publish
published: true
title: Ubuntu Format New Hard Drive
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1257
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1257
date: 2009-11-19 13:38:27.000000000 +00:00
categories:
- ubuntu
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you want to add another harddrive to your Ubuntu system, the easiest way to handle it is to use Gparted (think partition magic for Linux). You can install via the add applications menu in Applications.

Once you create your various partitions though, you might get confused because you can't actually write to them. Gparted makes the partitions owned by root. You are not root so you can't write to them.

All you need to do is open up terminal and do the following:
```

$ cd /media
$ ls

```
now note down the name of the partition(s) you need to write enable

For each one do the following:
```

$ sudo chown {yourlogin}:{yourlogin} {partion name}

```

replacing the {bits like this} with the correct values for you.
