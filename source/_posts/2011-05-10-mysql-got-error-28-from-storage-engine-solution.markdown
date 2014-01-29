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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
