---
layout: post
status: publish
published: true
title: Magento Add Stylesheet to Head for Specific Category
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2662
wordpress_url: http://www.edmondscommerce.co.uk/?p=2662
date: 2011-10-05 12:12:05.000000000 +01:00
categories:
- magento
tags:
- Cascading Style Sheets
- design
- magento
- custom
- xml
- layout
- tip
- category
- stylesheet
- include
- head
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you want to include a custom stylesheet for a particular category you can do this very cleanly by specifying custom layout xml in the category admin.

Simply find the category you want to apply this to and then hit the ```display settings
 tab

Then in the custom layout update  box, paste something like this:

[xml]
<reference name="head">
<action method="addCss"><stylesheet>css/extra_styles.css</stylesheet></action>
</reference>

```

clear your cache and this stylesheet should be included in the head section for this category.

You could of course do this in the layout XML files, however if you need somethign that the admin of the site can easily apply to any other new categories that needs the same treatment then this is a great solution.
