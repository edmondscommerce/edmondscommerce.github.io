---
layout: post
status: publish
published: true
title: 'Netbeans: Where''s my Refresh button gone?'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2591
wordpress_url: http://www.edmondscommerce.co.uk/?p=2591
date: 2011-08-23 16:03:25.000000000 +01:00
categories:
- netbeans
tags:
- development
- linux
- netbeans
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you ever find yourself in that annoying situation where netbeans refuses to see a file or set of files you've added to a folder, there is a solution.

My instinct having used netbeans for the past year was to right-click the folder and click Refresh.  The problem being that the Refresh item was missing from the menu!

It turns out that if you have "Enable auto-scanning of sources" enabled (which it is by default) in "Tools->Options->Miscellaneous->Files", netbeans assumes that it will know when you add a file, so you'll never have to refresh the folders.  Unfortunately, that assumption is not always correct and the folder will not refresh.

So the answer is to uncheck that option, right-click the folder and "Refresh", and if you like the option, turn it back on.
