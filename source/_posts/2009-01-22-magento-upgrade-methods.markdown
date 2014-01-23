---
layout: post
status: publish
published: true
title: Magento Upgrade Methods
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 100
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/magento-upgrade-methods/
date: 2009-01-22 10:05:53.000000000 +00:00
categories:
- php
tags:
- magento
- upgrade
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Upgrading Magento can be a little tricky. I would definitely advise testing out any upgrades on a development copy of your site, not applying updates directly to the live site without testing for problems first. 

Being such a young platform, Magento is in a phase of rapid development. Inevitably this development will introduce bugs and issues. Hopefully these will generally be minor but even so, you would want to get them resolved before applying them to your live site.

That said, here are some ways to upgrade Magento:

<b>1. Via Magento Connect</b>
Go to Magento Connect (System->Magento Connect in Admin Menu). Then in the extension key bit paste the following:
```

magento-core/Mage_All_Latest

```
<b>2. Via Command Line (SSH Access Required)</b>

If you have SSH access to your host, you can run the following commands to upgrade.
```

./pear mage-setup .
./pear install -f magento-core/Mage_All_Latest-stable 

```

<b>3. Clean Install over Existing Database</b>
Finally you can download the latest package and install it, but point it at an existing Magento database. In theory it should then upgrade the Magento database to suit the current version. This method has not been that reliable for me though.
