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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
``` bit to it. 
