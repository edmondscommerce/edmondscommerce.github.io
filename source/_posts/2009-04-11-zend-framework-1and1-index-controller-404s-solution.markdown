---
layout: post
status: publish
published: true
title: Zend Framework 1and1 Index Controller 404s + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 320
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=320
date: 2009-04-11 10:28:44.000000000 +01:00
categories:
- zend framework
tags:
- 1and1 zend framework
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Been tearing my hair out this morning trying to figure out why a Zend Framework based app was giving me 404 messages on any actions that specified the index controller. To explain, any URL that ended with /index or index/{action_name} would give me the ugly 1and1 404 message.

locally of course it worked fine. I messed around with my error controller but it seemed that the ZF app wasn't even being consulted, this was a lower level 404 error.

After some digging around, the solution is to disable something called MultiViews. The MultiViews option allows a file to be called even if the extension is not loaded, so index would look for any files called index, regardless of their extension. 

I'm not really sure why you would want this behaviour, maybe that's why I have never encountered it before. Anyway, to disable it and get your app working the way you want, simply add the following line to your htaccess file:

```

Options -MultiViews

```

For information, this is my full htaccess file that works on 1and1 hosting:

```

Options -MultiViews
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} -s [OR]
RewriteCond %{REQUEST_FILENAME} -l [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^.*$ - [NC,L]
RewriteRule ^.*$ /path/from/docroot/public/ [NC,L]

```

This particular app is running from a subfolder. If your public folder is the document root then that line would simply be /<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.edmondscommerce.co.uk/blog/php/1and1-has-gui-unzip-functionality/" rel="nofollow"><b>1and1</b> has GUI Unzip Functionality | Edmonds Commerce Blog</a><br><a href="http://zendguru.wordpress.com/2008/11/12/zend-pagination-example/" rel="nofollow"><b>Zend</b> Pagination example « <b>Zend Framework</b></a><br><a href="http://darkyblog.darkylandia.es/2007/12/24/zend-framework-mod_rewrite-y-apache-13/" rel="nofollow">Darky’s Blog » Blog Archive » <b>Zend Framework</b>, mod_rewrite y Apache 1.3</a><br><a href="http://elliottback.com/wp/1and1-sucks/" rel="nofollow"><b>1and1</b> Sucks: <b>1&amp;1</b> Will Rip You Off — Elliott C. Back</a><br></div>
