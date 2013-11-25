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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Sometimes it can be really hard to figure out exactly which file a chunk of code is coming from. At times like this the command line tool grep is immensely useful.

This snippet of code will search all php files within a specified folder. It will check through all files and sub folders for the string id="something"

```

find /path/to/root/search/folder/ -name "*.php" -print0 | xargs -0 grep 'id="something"'
```
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://beginlinux.wordpress.com/2009/04/03/using-grep/" rel="nofollow">Using <b>Grep</b> « Begin Linux Blog</a><br><a href="http://www.xmodx.com/31337/compaq-presario-cq40-340tu/" rel="nofollow">Compaq Presario CQ40-340TU | netstat -an | <b>grep</b> -i listen</a><br></div>
