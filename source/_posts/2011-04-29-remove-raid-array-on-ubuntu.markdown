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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Trying to upgrade to Natty and it seems to have tried to set up a RAID array which is causing me issues.

After a bit of messing around, the easy solution is to run:

```

sudo dmraid -rE

```
