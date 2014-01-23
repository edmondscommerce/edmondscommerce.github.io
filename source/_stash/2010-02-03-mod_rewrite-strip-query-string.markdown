---
layout: post
status: publish
published: true
title: mod_rewrite Strip Query String
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1352
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1352
date: 2010-02-03 10:24:06.000000000 +00:00
categories:
- mod_rewrite
tags:
- htaccess
- mod_rewrite
- query string
- strip
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
To make your RewriteRule strip the query string, simply append a ? to the end of the rewrite path, eg:

```

# redirect all requests to a subfolder to the home page
# strips query string
RewriteEngine On
RewriteBase /
RewriteRule ^subfolder/.*$ /index.php? [L,R=301]

```
