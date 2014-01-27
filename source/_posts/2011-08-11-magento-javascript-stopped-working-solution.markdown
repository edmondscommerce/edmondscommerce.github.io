---
layout: post
status: publish
published: true
title: Magento javascript stopped working + solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2564
wordpress_url: http://www.edmondscommerce.co.uk/?p=2564
date: 2011-08-11 14:52:58.000000000 +01:00
categories:
- magento
tags:
- javascript
- magento problem
- debug
- jquery
- solution
---
I've just spent to long trying to fix an infuriating problem with a simple fix. If you create a new theme from scratch and suddenly realise that none of your magento javascript is working, it could be because you've included jQuery and forgotten to include the noConflict argument.

If you have included jQuery, then make sure the following line is included at the top of your page.

<code>
jQuery.noConflict();
</code>
