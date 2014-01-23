---
layout: post
status: publish
published: true
title: Netbeans Clear Cache to Correct Broken Code Completion
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2139
wordpress_url: http://www.edmondscommerce.co.uk/?p=2139
date: 2011-02-16 11:37:30.000000000 +00:00
categories:
- netbeans
tags:
- netbeans
- auto
- cache
- fix
- code
- completion
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If your Netbeans project is behaving a bit weirdly with regards to code auto completion then this little fix might be for you.

Netbeans maintains a cache folder and it looks like this can get corrupted sometimes and need clearing out.

Close Netbeans down, empty your $HOME/.netbeans/6.9/var/cache/ folder and then restart Netbeans and hopefully that should fix it
