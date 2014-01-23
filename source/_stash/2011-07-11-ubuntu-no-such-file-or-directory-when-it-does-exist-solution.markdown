---
layout: post
status: publish
published: true
title: Ubuntu "No such file or directory" When it does exist + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2487
wordpress_url: http://www.edmondscommerce.co.uk/?p=2487
date: 2011-07-11 17:40:14.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- 64bit
- file
- solution
- 32bit
- directory
- does
- not
- exist
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are tearing your hair out trying to figure out why trying to run something is complaining that it doesn't exist when it clearly does, this is quite possibly your solution.

The problem is most likely that you are trying to run a 32bit package on a 64bit system.

The solution is easy enough, you need to set up your system to run 32bit packages.

```

apt-get install libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 ia32-libs

```
