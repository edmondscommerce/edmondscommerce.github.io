---
layout: post
status: publish
published: true
title: PHP Next Working Day
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1164
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1164
date: 2009-08-22 15:08:29.000000000 +01:00
categories:
- php
tags:
- php
- date
- snippet
- working day
- weekday
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Here's a nice little PHP snippet for you. The next weekday as a DD/MM/YYYY string:

```php

<?php
if(preg_match('%(Sat|Sun|Fri)%', date('D'))){
    $next_working_day = date('d/m/Y', strtotime('next Monday'));
}else{
    $next_working_day = date('d/m/Y', strtotime('+1 day'));
}
echo $next_working_day;
?>

```
