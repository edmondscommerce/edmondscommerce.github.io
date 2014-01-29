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

```<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://omelyn.com/top-10-wordpress-htaccess-hacks/" rel="nofollow">Top 10 Wordpress .<b>htaccess</b> hacks | Omelyn.com</a><br><a href="http://xplus3.net/2009/04/25/naming-a-htaccess-file-in-windows/" rel="nofollow">x + 3 - Naming a .<b>htaccess</b> File in Windows</a><br><a href="http://www.blogherald.com/2009/04/21/movable-type-monday-comment-via-twitter-and-htaccess-hacks/" rel="nofollow">Movable Type Monday: Comment via Twitter and .<b>htaccess</b> Hacks | The <b>...</b></a><br><a href="http://vladgh.com/2009/03/slackware-linux-apache2-mysql-php-ssl/" rel="nofollow">Slackware Linux, Apache2, MySQL, PHP, <b>SSL</b> | Vlad&#39;s and Alice&#39;s Blog</a><br><a href="http://luxsci.com/blog/how-does-secure-socket-layer-ssl-or-tls-work.html" rel="nofollow">How Does <b>Secure Socket Layer</b> (<b>SSL</b>) Work? | LuxSci FYI</a><br><a href="http://whatwouldnickdo.com/wordpress/431/quick-tomcat-https-ssl-config/" rel="nofollow">Quick Tomcat https <b>SSL</b> Config | /home/nick</a><br></div>
