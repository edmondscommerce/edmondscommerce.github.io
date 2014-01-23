---
layout: post
status: publish
published: true
title: PHP Detect if Script is running from CLI
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1591
wordpress_url: http://www.edmondscommerce.co.uk/?p=1591
date: 2010-04-01 13:55:30.000000000 +01:00
categories:
- php
tags:
- php
- CLI
- Detect
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you have a script that you want to behave differently depending on whether it is called from the command line or via a http request then this little snippet of code is what you need.

```php

    if(!defined('STDIN')){ //its not via command line
        // do non command line stuff
    }

```
