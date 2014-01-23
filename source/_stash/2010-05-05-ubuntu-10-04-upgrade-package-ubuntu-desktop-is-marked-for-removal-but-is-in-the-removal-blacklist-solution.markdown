---
layout: post
status: publish
published: true
title: Ubuntu 10.04 Upgrade "Package "ubuntu-desktop" is marked for removal, but is
  in the removal blacklist." + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1620
wordpress_url: http://www.edmondscommerce.co.uk/?p=1620
date: 2010-05-05 15:40:38.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- upgrade
- ubunut-desktop
- removal
- blacklist
- '10.04'
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
So far so good. Hit an issue on one machine that was running both Xubuntu and Ubuntu. 

Need to remove xubuntu-desktop before doing the upgrade to let it go through properly.

```

apt-get remove xubuntu-desktop

```

Restart the machine and try the update again, should all go fine



