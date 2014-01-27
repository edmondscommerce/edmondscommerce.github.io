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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
