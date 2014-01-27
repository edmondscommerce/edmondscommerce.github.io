---
layout: post
status: publish
published: true
title: Slow Truncating InnoDB Tables that have Foreign Keys set on them
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1764
wordpress_url: http://www.edmondscommerce.co.uk/?p=1764
date: 2010-08-10 17:12:34.000000000 +01:00
categories:
- mysql
tags:
- mysql
- speed
- innodb
- foreign keys
- truncate
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
One of the advantages of using InnoDB as your storage engine in MySQL is that you can create a database structure that will automatically keep itself clean and tidy, by having deletes cascade through your tables as soon as you delete the main entity.

However, if you need to empty a large table, you will find that this process is really slow.

The solution is to first of all truncate all of the tables that have foreign key relations set on the main table and then only empty the main table once those child tables are emptied.

Yes this defeats the object a bit, but if you want speed, this is the solution. It is incredibly fast in comparison, and the end result is the same.
