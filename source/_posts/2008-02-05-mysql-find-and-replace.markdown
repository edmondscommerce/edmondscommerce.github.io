---
layout: post
status: publish
published: true
title: MySQL Find and Replace
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 5
wordpress_url: http://www.edmondscommerce.co.uk/blog/mysql/mysql-find-and-replace/
date: 2008-02-05 11:08:34.000000000 +00:00
categories:
- mysql
tags:
- mysql
- find
- replace
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
One of the most common things that needs to be done when tidying up a database is to bulk find and replace data in MySQL tables. This can be for things like spelling mistakes, changing categories of products or any other value held in a MySQL database table.

Its an easy thing to do though and here is the code:

```mysql


update [table_name] set [field_name] = replace([field_name],'[string_to_find]','[string_to_replace]');


```

note - nice syntax highlighting plugin used is mentioned <a href="http://www.davidnaylor.co.uk/wordpress-code-display.html" target="_blank">here</a>
