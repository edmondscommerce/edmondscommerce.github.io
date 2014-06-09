---
layout: post
status: publish
published: true
title: Magento 500 Error + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 219
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=219
date: 2009-03-11 10:41:10.000000000 +00:00
categories:
- magento
tags:
- magento mod_rewrite
- magento 500 error
- magento error
---
On a recent clean installation on a 1and1 Linux server for a client, the site was getting 500 errors on every page other than the home page. The fix for this was to add the following line to the .htaccess file in the document root:

<b>RewriteBase /</b>

Hope this helps someone else out

```

############################################
## you can put here your magento root folder
## path relative to web root

    #RewriteBase /magento/
	RewriteBase /

``` 
