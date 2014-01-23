---
layout: post
status: publish
published: true
title: Ubuntu Prevent Focus Stealing
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3072
wordpress_url: http://www.edmondscommerce.co.uk/?p=3072
date: 2012-04-05 15:07:19.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- compiz
- gconf
- editor
- focus
- stealing
---
If you find yourself typing away whilst something else loads or another window pops open and all of a sudden your typing has gone into a different window then this solution is for you

Open gconf-editor. Open a terminal and type gconf-editor and hit return.

Now navigate to /apps/compiz/general/screen0/options/focus_prevention_level key and set its value to 4.

That's it. 

You might actually decide that focus stealing is sometimes useful in which case you can always change it back.

Originally found here: <a href="http://askubuntu.com/a/55220">http://askubuntu.com/a/55220</a>

