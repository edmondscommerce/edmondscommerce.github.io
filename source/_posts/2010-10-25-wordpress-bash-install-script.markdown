---
layout: post
status: publish
published: true
title: Wordpress Bash Install Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1866
wordpress_url: http://www.edmondscommerce.co.uk/?p=1866
date: 2010-10-25 11:58:11.000000000 +01:00
categories:
- wordpress
tags:
- wordpress
- bash
- install
- sh
- script
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Easy peasy:

```

#!/bin/bash
wget http://wordpress.org/latest.zip
unzip latest.zip
cp -rf ./wordpress/* ./

```

handy little bash script to install word press
