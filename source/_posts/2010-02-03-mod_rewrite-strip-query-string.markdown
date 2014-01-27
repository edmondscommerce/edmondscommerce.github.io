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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
