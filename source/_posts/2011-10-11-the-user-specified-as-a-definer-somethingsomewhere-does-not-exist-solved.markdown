---
layout: post
status: publish
published: true
title: The user specified as a definer ('something'@'somewhere') does not exist +SOLVED
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2669
wordpress_url: http://www.edmondscommerce.co.uk/?p=2669
date: 2011-10-11 13:34:26.000000000 +01:00
categories:
- mysql
tags:
- mysql
- linux
- error
- solution
- user specified
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Today I was working on an oscommerce site and took a backup of their database, created the usual details from their config file on my local mysql and the above error came up (with admin@localhost for what it's worth).

Upon investigation, a trigger had been created on the database whilst logged in via a different user than the user specified in the config file.

There's actually a few solutions depending on your needs :-
Ensure the user (something@somewhere) is created on your new database installation
Delete the trigger (for instance if testing locally and you know it's not needed)
Edit the DB dump file, find the definition of the trigger and change it to the configured user.
