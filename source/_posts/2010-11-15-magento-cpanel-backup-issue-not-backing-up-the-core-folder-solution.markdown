---
layout: post
status: publish
published: true
title: Magento cPanel Backup Issue - Not Backing up the Core Folder + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1903
wordpress_url: http://www.edmondscommerce.co.uk/?p=1903
date: 2010-11-15 13:06:28.000000000 +00:00
categories:
- magento
tags:
- problem
- magento
- hosting
- backup
- solution
- cpanel
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are hosting a Magento site on cPanel powered hosting and are relying on the cPanel backup system to manage backing up your files then you need to be aware of this issue.

After a recent upgrade, cPanel has started to ignore any code inside a core/ directory when doing backups.

Of course this means that your app/code/core folder will not be backed up - of course this is the most crucial folder in your Magento installation. 

Hopefully you are not editing core files anyway, so ultimately you shoudl be able to redownload your Magento version and extract the app/code/core folder from there, but even so, this is an extra step that you might need to take which will slow down your recovery in case of a disaster.

See this Magento forum thread for more details:

http://www.magentocommerce.com/boards/viewthread/210785/

