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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
