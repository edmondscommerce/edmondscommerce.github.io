---
layout: post
status: publish
published: true
title: Remove Raid Array on Ubuntu
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2240
wordpress_url: http://www.edmondscommerce.co.uk/?p=2240
date: 2011-04-29 08:11:14.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- installer
- dm-0
- dmsetup
- mda
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Trying to upgrade to Natty and it seems to have tried to set up a RAID array which is causing me issues.

After a bit of messing around, the easy solution is to run:

```

sudo dmraid -rE

```
