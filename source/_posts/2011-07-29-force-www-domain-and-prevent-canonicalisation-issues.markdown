---
layout: post
status: publish
published: true
title: Force WWW Domain and Prevent Canonicalisation Issues
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2519
wordpress_url: http://www.edmondscommerce.co.uk/?p=2519
date: 2011-07-29 11:04:13.000000000 +01:00
categories:
- magento
tags:
- seo
- serp
- magento
- rewrite
- htacess
- canonical
---
A really easy problem to fix that we still see on some live sites is having the site accessible with and without the www (or whatever sub domain).

On Magento sites this can cause issues with session IDs being appended to URLs that then get indexed by google and cause problems.

Here is a snippet which you can add to your htaccess file to fix this:
```

RewriteBase / RewriteCond %{THE_REQUEST} ^[A-Z]{3,9} /index.php HTTP/
RewriteRule ^index.php$ http://www.domain.com/ [R=301,L]

```

Obviously you need to change domain.com to be your actual domain.

If your store is running in a sub folder eg http://www.domain.com/magento/

```

RewriteBase /magento/ RewriteCond %{THE_REQUEST} ^[A-Z]{3,9} /magento/index.php HTTP/
RewriteRule ^index.php$ http://www.domain.com/magento/ [R=301,L]

```
