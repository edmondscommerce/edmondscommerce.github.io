---
layout: post
status: publish
published: true
title: MySQL Got Error 28 From Storage Engine + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2246
wordpress_url: http://www.edmondscommerce.co.uk/?p=2246
date: 2011-05-10 11:03:51.000000000 +01:00
categories:
- linux
tags:
- mysql
- linux
- server
- error
- hosting
- db
- space
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you get the error:

<strong>Got error 28 from storage engine query</strong>

When you are trying to access your web site, database or phpMyAdmin then the problem is likely to be that you have run out of hard disk space.

If you have command line access you can quickly check this by running 

```

df -h

```

If you do see a partition with low or no space then the solution is simply to find and remove files that are not required and you should be back up and running.
