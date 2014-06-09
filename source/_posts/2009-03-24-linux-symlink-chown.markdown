---
layout: post
status: publish
published: true
title: Linux Symlink chown
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 263
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=263
date: 2009-03-24 13:35:08.000000000 +00:00
categories:
- linux
tags:
- linux
- symlink
- chown
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you create a symlink via SSH then chances are you are logged in as the root user and the symlink will be created as root. Usually though you will want to the symlink to belong to another owner:group.

If you try to use chown it will silently fail to change the ownership of the symlink, though instead it will change the ownership of the file the symlink is pointing to.

If you want to make it actually change the owner:group of the symlink, us the switch -h.

For example:

```

chown -h user:group symlink

``` 
