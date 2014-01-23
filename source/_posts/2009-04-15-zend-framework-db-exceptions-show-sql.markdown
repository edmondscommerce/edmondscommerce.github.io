---
layout: post
status: publish
published: true
title: Zend Framework DB Exceptions  - Show SQL
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 324
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=324
date: 2009-04-15 14:59:25.000000000 +01:00
categories:
- zend framework
tags:
- zend_db
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Its all well and good showing me the MySQL error information, but these kinds of messages always refer to the actual SQL being submitted. 

As Zend_Db is an abstraction layer, it is often not exactly clear precisely what SQL is being submitted and causing an error.

To fix this and make the exceptions display the actual SQL as well, you need to make a small edit to the file Zend/Db/Statement/{adapter}.php

For me I tend to use the Mysqli adapter so I have edited the file Mysqli.php

In there is a function _prepare.

Line 84 of that file I have updated to the following:

```php

throw new Zend_Db_Statement_Mysqli_Exception("Mysqli prepare error: " . $mysqli->error . "<br><br>SQL:<br>" . $sql);

```

if you wanted to do the same for a different adapter, it should be easy enough to add the ```php
. "<br><br>SQL:<br>" . $sql
``` bit to it.<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.qc4blog.com/?p=390" rel="nofollow">call sql functions with Zend_Db</a><br><a href="http://blog.welmers.net/bastiaan/2008/12/zend_db-and-utf-8.html" rel="nofollow">Bastiaans Blog » Blog Archive » <b>Zend_Db</b> and UTF-8</a><br><a href="http://www.qc4blog.com/?p=396" rel="nofollow">Zend_Db &amp; transactions</a><br></div>
