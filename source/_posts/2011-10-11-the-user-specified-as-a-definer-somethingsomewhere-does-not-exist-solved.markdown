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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Today I was working on an oscommerce site and took a backup of their database, created the usual details from their config file on my local mysql and the above error came up (with admin@localhost for what it's worth).

Upon investigation, a trigger had been created on the database whilst logged in via a different user than the user specified in the config file.

There's actually a few solutions depending on your needs :-
Ensure the user (something@somewhere) is created on your new database installation
Delete the trigger (for instance if testing locally and you know it's not needed)
Edit the DB dump file, find the definition of the trigger and change it to the configured user.
