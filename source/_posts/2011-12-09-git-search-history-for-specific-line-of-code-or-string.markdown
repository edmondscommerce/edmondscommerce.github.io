---
layout: post
status: publish
published: true
title: Git Search History for Specific Line of Code or String
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2749
wordpress_url: http://www.edmondscommerce.co.uk/?p=2749
date: 2011-12-09 11:18:51.000000000 +00:00
categories:
- git
tags:
- git
- debug
- search
- log
- string
- history
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to track down exactly how and when a particular change happened and you are not even sure exactly where it is (perhaps because its no longer present but you are not totally sure where it was supposed to be) then this little trick can be a life saver.

You can search git log for a specific string with the -S flag

eg, searching for a constant definition

git -log -SCONSTANT_NAME

very handy indeed :)
