---
layout: post
status: publish
published: true
title: osCommerce Payment Module Configuration Not Saving + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1310
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1310
date: 2010-01-15 17:04:24.000000000 +00:00
categories:
- oscommerce
tags:
- oscommerce
- problem
- module
- admin
- payment
- configuration
- update
- solution
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are having a weird problem with your payment modules not saving the configuration when you edit them via the admin, try this to see if it fixes it:

in admin/modules.php

find:
```php

  while (list($key, $value) = each($HTTP_POST_VARS['configuration'])) {

```

and replace it with 

```php

  //while (list($key, $value) = each($HTTP_POST_VARS['configuration'])) {
foreach ($HTTP_POST_VARS['configuration'] as $key => $value){

```
