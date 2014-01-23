---
layout: post
status: publish
published: true
title: Magento Tip - Rename Your Theme Directory
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 150
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=150
date: 2009-02-19 16:40:56.000000000 +00:00
categories:
- magento
tags:
- magento
- upgrade
- theme
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
A common mistake made with Magento installations is that the the standard theme (eg default) is customised to suit the look of the site but is still kept in a folder called default. If you do this then whenever you want to upgrade your Magento store, the theme folder will be overwritten causing you all kinds of problems. I hope you had a backup!

All you need to do is make sure that if you are running a custom theme - even if it is simply a modified version of the default theme, make sure that it is set up a separate theme with it's own name. This way you will be able to upgrade Magento without too much theme problems.

We never recommend applying a Magento upgrade to a live site, instead set up a password protected dev subdomain which has a fully functional copy of your store. You can then test out upgrades on this version first, sort out any problems and then only update the live site once you are happy it will work fine.

Edmonds Commerce specialise in helping ecommerce businesses set up or migrate to a Magento based solution - get in touch today.
