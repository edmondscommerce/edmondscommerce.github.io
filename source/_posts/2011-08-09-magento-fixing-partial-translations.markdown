---
layout: post
status: publish
published: true
title: Magento Fixing Partial Translations
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2557
wordpress_url: http://www.edmondscommerce.co.uk/?p=2557
date: 2011-08-09 11:51:41.000000000 +01:00
categories:
- magento
tags:
- magento
- developer
- translations
- site
- creation
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
When building a web site that is in multiple languages, it can be difficult to make sure that all text in the template is in the __() wrapper, and even if it all is, then fill out the translations files with all the text necessary.

Magneto has this really nice option called "Translate Inline" configurable form the admin panel by going to System > Configuration > Advanced > Developer > Translate Inline. This option must not be enabled on a live site, when it is enabled block and translations caches need to be disabled for it to work correctly.

With Translate Inline enabled, any page with any text in the __() wrapper will have a red outline around it, hovering over the text will display a small book icon. Clicking this icon will bring up a translation entry box. Once the box has been filled out, the translation is stored in the database and that translation is saved. If you find some text that doesn't have a red box around it, the text is probably missing the __() wrapper in the template.
