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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
