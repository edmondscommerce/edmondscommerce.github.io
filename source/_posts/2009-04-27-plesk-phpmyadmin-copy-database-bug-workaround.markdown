---
layout: post
status: publish
published: true
title: Plesk phpMyAdmin Copy Database Bug + Workaround
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 353
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=353
date: 2009-04-27 15:54:22.000000000 +01:00
categories:
- hosting
tags:
- plesk
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are administering a plesk server running version 8.x then you are likely dealing with phpMyAdmin version 2.8.x.x which has a bug that prevents you from performing database copy operations due to one missing space in the generated SQL.

One possible solution here is to simply install phpMyAdmin in its own right and of course use the latest version which has resolved this bug.

If however you would rather not bother with that, you can do this quite easily from the command line using the following commands.

First the SQL query:
```

CREATE DATABASE db2;

```

Then, from the command-line, do the following:
```

$ mysqldump -u root --password=pass db1 | mysql -u root --password=pass db2

```

I suppose you could start hacking on the bundled phpMyAdmin source code to fix the bug without upgrading the whole version... Ever looked at the phpMyAdmin source code? 

:-) 
