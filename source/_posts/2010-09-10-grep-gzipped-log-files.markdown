---
layout: post
status: publish
published: true
title: Grep Gzipped Log Files
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1820
wordpress_url: http://www.edmondscommerce.co.uk/?p=1820
date: 2010-09-10 09:13:57.000000000 +01:00
categories:
- linux
tags:
- zgrep grep gz gzipped linux log files archived search
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to grep through some archived log files in gz format - don't be extracting them and then using grep to search, just use zgrep to grep them directly.

Easy!

```

zgrep 'my_search_string' access_log.processed.1.gz > zgrep_results && less zgrep_results

```
