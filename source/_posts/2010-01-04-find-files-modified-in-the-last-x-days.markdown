---
layout: post
status: publish
published: true
title: Find Files Modified in the last X Days
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1297
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1297
date: 2010-01-04 14:29:01.000000000 +00:00
categories:
- linux
tags:
- find
- linux
- files
- modied
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you need to check which files (eg PHP files for example) have been modified within the last few days, you can run this quick command.

```

find . -mtime -36 -iname "*.php" -fprint modded.txt

```

This will generate a list and save it to a file called modded.txt.
