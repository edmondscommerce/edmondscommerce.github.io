---
layout: post
status: publish
published: true
title: 'CRELoaded Remove Google Ads  - '
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 70
wordpress_url: http://www.edmondscommerce.co.uk/blog/oscommerce/creloaded-remove-google-ads/
date: 2008-08-13 15:32:05.000000000 +01:00
categories:
- oscommerce
- creloaded
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you install the free version of CRELoaded, you will see that they have sneaked some Google adverts onto the bottom of your site. 

Above the adverts will be the text

<strong>This site is a member of the CRE Loaded Open Source Ecommerce Software community</strong>

Bit of an underhand tactic but I suppose you have to try to make cash where you can these days...

I could go onto a big rant about how they are trying to make cash by simply repackaging software which was always meant to be given away freely and without hitches, including both osCommerce and the multitude of contributions they have added on there. I'm not going to though. CRELoaded is a good product and these guys are keeping the osCommerce platform as a viable modern open source ecommerce platform.

Anyway - cut to the chase - to get rid of these annoying adverts all you have to do is open up

includes/javascript/cart_links.js.php

It should look like this:

```php

<?php if ($cart_links == 'close'){$cart_link1= 'dothis';} else if ($cart_links == 'close') {$paymentclose = 'true';} if ( strstr(basename($_SERVER['SCRIPT_FILENAME']),'popup_') != basename($_SERVER['SCRIPT_FILENAME'] ) ) {@include('http://www.creloaded.com/cre_google.js');}
 ?>

```

and replace the entire contents with

```php

<?php if ($cart_links == 'close'){$cart_link1= 'dothis';} else if ($cart_links == 'close') {$paymentclose = 'true';}
/*
 if ( strstr(basename($_SERVER['SCRIPT_FILENAME']),'popup_') != basename($_SERVER['SCRIPT_FILENAME'] ) ) {@include('http://www.creloaded.com/cre_google.js');}
 */
 ?>

```

That's it.
