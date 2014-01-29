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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are tearing your hair out trying to figure out why trying to run something is complaining that it doesn't exist when it clearly does, this is quite possibly your solution.

The problem is most likely that you are trying to run a 32bit package on a 64bit system.

The solution is easy enough, you need to set up your system to run 32bit packages.

```

apt-get install libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 ia32-libs

```
