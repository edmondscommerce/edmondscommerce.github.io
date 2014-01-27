---
layout: post
status: publish
published: true
title: Full PHP Error Display for Vhost
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 96
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/full-php-error-display-for-vhost/
date: 2009-01-12 15:34:38.000000000 +00:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
To get PHP displaying all errors on a particular apache vhost, simply add the following two lines within the vhost configuration

```

php_value display_errors On
php_value error_reporting 6143

```
