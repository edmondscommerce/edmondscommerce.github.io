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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
So far so good. Hit an issue on one machine that was running both Xubuntu and Ubuntu. 

Need to remove xubuntu-desktop before doing the upgrade to let it go through properly.

```

apt-get remove xubuntu-desktop

```

Restart the machine and try the update again, should all go fine



