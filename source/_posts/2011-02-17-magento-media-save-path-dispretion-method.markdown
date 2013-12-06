---
layout: post
status: publish
published: true
title: Magento Media Save Path Dispretion Method
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2142
wordpress_url: http://www.edmondscommerce.co.uk/?p=2142
date: 2011-02-17 15:28:57.000000000 +00:00
categories:
- magento
tags:
- magento
- upload
- file
- path
- image
- save
- dispretion
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you want to calculate the actual save path that Magento will use for an image file for example then you might find yourself scouring the source code for the specific method that does this.

It's not the easiest to find, in fact its tucked away in the lib folder inside the Varien_File_Uploader class.

The method in question is a usefully static method Varien_File_Uploader::getDispretionPath();

Sorted!
