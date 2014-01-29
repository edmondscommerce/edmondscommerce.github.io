---
layout: post
status: publish
published: true
title: osCommerce Checkout Problems + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1312
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1312
date: 2010-01-19 10:33:14.000000000 +00:00
categories:
- oscommerce
tags:
- oscommerce
- table
- problem
- checkout
- sql
- repair
- sessions
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If your osCommerce checkout starts behaving badly and bits of info seem to go missing eg billing address then you should definitely try this fix before you tear your hair out completely.

Most osCommerce installs store session information to a MySQL table called (suprisingly) sessions.

Sometimes (I have only seen this twice on umpteen osCommerce sites) the sessions table will become corrupted. The irritating thing is that if this happens it seems that the site will not stop working completely with a useful error message, but instead will continue to work but will behave very strangely.

If your osCommerce site is behaving strangely then try this fix.

Open phpMyAdmin and select your SQL database and then copy and paste the following into the SQL section and hit run:

```php

REPAIR TABLE `sessions`;

```
