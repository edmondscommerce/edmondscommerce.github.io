---
layout: post
status: publish
published: true
title: Suse Home Folder Problems
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 158
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=158
date: 2009-02-22 14:24:52.000000000 +00:00
categories:
- open suse
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
I recently had a really strange issue with Open Suse 11 - the contents of my home directory were totally invisible if using the file manager.

I could see them in the terminal, however I was only able to run the ls -al command as root. If I did it at my normal user level, it just hung.

After a load of reading around it seems that the culprit may well have been dodgy files in the /tmp folder.

So I removed all of the files in the /tmp folder using the command

```

rm -R /tmp/*

```

And then restarted and it now seems to be working fine.

However, I still haven't figured out the NetworkManager problem and have to manually start NetworkManager on every boot.
