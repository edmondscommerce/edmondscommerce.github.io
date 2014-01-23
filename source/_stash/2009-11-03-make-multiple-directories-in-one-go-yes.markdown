---
layout: post
status: publish
published: true
title: Make Multiple Directories in One Go - Yes!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1238
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1238
date: 2009-11-03 15:23:39.000000000 +00:00
categories:
- ubuntu
tags:
- directories
- ubuntu
- linux
- multiple
- path
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you work with applications that have a lot of nested directories (ahem Magento) then you might really like this.

In one command, you can make an entire path of nested directories with the command mkdirhier.

eg 

```

mkdirhier EC/Custom/Model/Blah/Something/Really/Deep

```

You need to have xutils-dev installed
```

sudo apt-get install xutils-dev

```

Oh yeah of course you have to be running a proper developers operating system as well :)
