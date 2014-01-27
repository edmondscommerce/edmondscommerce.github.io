---
layout: post
status: publish
published: true
title: New Easy MVC Framework for WYSIWYG Designers (and PHP developers)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1205
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1205
date: 2009-10-21 08:05:44.000000000 +01:00
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
I seem to be incredibly busy this month...

Managed to do a lot though. One cool thing is the creation of a shared hosting friendly (and also wysiwyg designer friendly) MVC framework. It doesn't require anything more fancy than PHP5 with PDO. No open base dir problems, no modifying the include path problems, no bloat problems, no excess complexity problems.

We do a lot of subcontracting for design agencies and needed something that we could work on at the same time, with proper separation of visual design and logic. However the current big frameworks are all a bit too heavy duty so we have rolled our own small MVC system.

It uses a lot of Jquery to create nice interactive forms and as much as possible auto generates forms etc from the database structure. Its all designed with a view to enabling us to achieve rapid application development whilst still being accessible to non technical (Dreamweaver) designers as much as possible.

All the template files are pure HTML files with no PHP logic in them what so ever. This means that the WYSIWYG designer can work comfortably in a way that is familiar.

We aim to release the framework as open source shortly, just need to go over the code and documentation to make sure that it is a good cohesive package.

If you are designer looking to launch a bespoke site and would be interested in leveraging modern techniques and nice Jquery javascript to easily create a really professional quality product that isn't going to break the bank, get in touch.
