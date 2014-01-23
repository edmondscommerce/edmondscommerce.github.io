---
layout: post
status: publish
published: true
title: Magento Multistore Setup in a Nutshell
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1195
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1195
date: 2009-09-26 09:24:13.000000000 +01:00
categories:
- magento
tags:
- magento
- multistore
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
One of the really cool features of Magento is the ability to easily setup a multistore on one installation of Magento. If you have never done it before though it can be a little tricky.

Here is very brief guide:

First create the stores. This is all done via the Magento administration.

System->Manage Stores

foreach store that you want, create a website, store and store view. Make a note of the codes as you need those in the code below.

Then in your index.php file have some code like this:
```php

umask(0);

    switch($_SERVER['HTTP_HOST']) {

     case 'first-store.com':
     case 'www.first-store.com':
        Mage::run('store1', 'store');
     break;

     case 'second-store.com':
     case 'www.second-store.com':
        Mage::run('store2', 'store');
     break;


     case 'third-store.com':
     case 'www.third-store.com':
        Mage::run('store3', 'store');
     break;
    
     default: //run the default store if for some reason the above hasn't worked.
        Mage::run();
     break;
      } 

```
