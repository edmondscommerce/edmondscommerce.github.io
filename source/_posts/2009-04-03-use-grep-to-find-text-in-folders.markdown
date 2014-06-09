---
layout: post
status: publish
published: true
title: Use Grep To Find Text In Folders
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 293
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=293
date: 2009-04-03 15:53:37.000000000 +01:00
categories:
- linux
tags:
- grep
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Sometimes it can be really hard to figure out exactly which file a chunk of code is coming from. At times like this the command line tool grep is immensely useful.

This snippet of code will search all php files within a specified folder. It will check through all files and sub folders for the string id="something"

```

find /path/to/root/search/folder/ -name "*.php" -print0 | xargs -0 grep 'id="something"'
```
 
