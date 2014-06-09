---
layout: post
status: publish
published: true
title: Htaccess Force SSL with Redirect (Non Standard SSL Port Compatible)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 356
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=356
date: 2009-04-28 11:07:26.000000000 +01:00
categories:
- hosting
tags:
- ssl
- htaccess
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Check out this little snippet of htaccess code to force SSL usage. Works regardless of port.

```

RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

``` 
