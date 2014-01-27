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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you need to grep through some archived log files in gz format - don't be extracting them and then using grep to search, just use zgrep to grep them directly.

Easy!

```

zgrep 'my_search_string' access_log.processed.1.gz > zgrep_results && less zgrep_results

```
