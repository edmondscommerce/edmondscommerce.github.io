---
layout: post
status: publish
published: true
title: Remove Double Slashes from URL without Breaking It
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2988
wordpress_url: http://www.edmondscommerce.co.uk/?p=2988
date: 2012-02-24 16:58:38.000000000 +00:00
categories:
- php
tags:
- replace
- php
- slash
- regex
- url
- preg
- double
- clean
---
If you need to clean up a URL and remove any double (or more) slashes that might have crept in, but need to keep the :// bit intact you might like this little function

```php

    protected function removeDoubleSlash($in) {
        return preg_replace('%([^:])(
```

Handy :)
