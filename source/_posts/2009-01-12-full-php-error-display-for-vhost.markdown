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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
To get PHP displaying all errors on a particular apache vhost, simply add the following two lines within the vhost configuration

```

php_value display_errors On
php_value error_reporting 6143

```
