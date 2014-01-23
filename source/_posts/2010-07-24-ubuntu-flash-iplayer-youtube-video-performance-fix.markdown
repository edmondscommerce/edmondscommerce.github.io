---
layout: post
status: publish
published: true
title: Ubuntu Flash iPlayer Youtube Video Performance Fix
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1746
wordpress_url: http://www.edmondscommerce.co.uk/?p=1746
date: 2010-07-24 11:14:33.000000000 +01:00
categories:
- ubuntu
tags:
- performance
- ubuntu
- flash
- video
- iplayer
- youtube
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are finding iPlayer or Youtube videos are using excessive amounts of CPU, it might be worth trying this fix

Simply create a folder in /etc called adobe (assuming it doesn't already exist)

```

sudo mkdir /etc/adobe

```

now create a file called mms.cfg with this single line in it:

```

OverrideGPUValidation=true

```

```

sudo gedit /etc/adobe/mms.cfg

```

Now save it and restart firefox and you should hopefully find your flash video performance is dramatically improved. I got a 30% reduction.

Solution originally seen here:
<a href="http://ubuntuforums.org/showpost.php?p=7535876&postcount=70">http://ubuntuforums.org/showpost.php?p=7535876&postcount=70</a>

It says intel graphics cards only, but its worth a try if you are running another or you are not sure.
