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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
On a recent clean installation on a 1and1 Linux server for a client, the site was getting 500 errors on every page other than the home page. The fix for this was to add the following line to the .htaccess file in the document root:

<b>RewriteBase /</b>

Hope this helps someone else out

```

############################################
## you can put here your magento root folder
## path relative to web root

    #RewriteBase /magento/
	RewriteBase /

```<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.sharpdotinc.com/mdost/2009/03/10/magento-error-simplexmlelementaddattribute-attribute-already-exists/" rel="nofollow"><b>Magento</b>: <b>Error</b> - SimpleXMLElement::addAttribute() Attribute <b>...</b></a><br><a href="http://www.casualcommerce.com/2009/02/magento-notes-file-access-error-in-admin-page-catalog-and-inventory-links/" rel="nofollow">Casual Commerce » <b>Magento</b> Notes - File access <b>error</b> in admin page <b>...</b></a><br><a href="http://www.sharpdotinc.com/mdost/2009/02/10/magento-121-cant-login-error/" rel="nofollow">Magento 1.2.1 - Can’t Login Error</a><br><a href="http://www.crucialwebhost.com/blog/magento-hosting/" rel="nofollow">Crucial Web Hosting » Blog » <b>Magento</b> Hosting</a><br><a href="http://yesure.wordpress.com/2009/03/06/links-for-2009-03-05/" rel="nofollow">links for 2009-03-05</a><br></div>
