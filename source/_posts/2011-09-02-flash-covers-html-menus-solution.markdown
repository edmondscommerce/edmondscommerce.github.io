---
layout: post
status: publish
published: true
title: Flash covers html menus +solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2611
wordpress_url: http://www.edmondscommerce.co.uk/?p=2611
date: 2011-09-02 13:41:51.000000000 +01:00
categories:
- web development
tags:
- web design
- firefox
- ubuntu
- linux
- chrome
- flash
- z-index
- menus
- drop-down
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you've ever had that annoying problem where someone has asked you to put a flash banner on a site and it covers up your nice dropdown or pop-out menus, you'll be glad to know that the current versions of flash don't do that if you set the right parameter!  Yes that even includes flash on Linux browsers!

The parameter is called "wmode" and needs to be set to "transparent" for the z-index problem to go away.

Don't forget that search engines don't read the text in flash files so you don't want to use flash where you don't have to, but when a banner is required and is provided by a third party it's not always possible to avoid it.
