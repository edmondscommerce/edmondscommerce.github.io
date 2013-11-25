---
layout: post
status: publish
published: true
title: Cron Creating Lots of Files in Home Directory
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1190
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1190
date: 2009-09-22 15:55:14.000000000 +01:00
categories:
- linux
tags:
- linux
- server
- cron
- files
- home directory
- root
- wget
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you have some cron jobs set up and you are finding large amounts of files saved in your home directory (or root) then perhaps you have the same issue I had.

I was using wget to call on some PHP scripts to run periodically. wget will do what it says on the tin and save the files. If you don't want it to do that, you need to add the following in front of your wget command:
```

-O /dev/null 

```

eg 
```

wget -O /dev/null http://script.com/script.php

```
