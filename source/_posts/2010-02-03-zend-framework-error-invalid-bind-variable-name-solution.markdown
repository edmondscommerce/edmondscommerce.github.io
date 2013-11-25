---
layout: post
status: publish
published: true
title: Zend Framework Error Invalid bind-variable name + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1354
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1354
date: 2010-02-03 12:55:28.000000000 +00:00
categories:
- zend framework
tags:
- zend framework
- exception
- error
- named parameters
- bind variable name
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you encounter the error :

<strong>Invalid bind-variable name xxxxxx</strong> 

When trying to use named bound parameters with Zend Framework, then you are probably using the Mysqli adapter. Unfortunately this doesn't actually support named parameters, but the Exception message isn't really clear on that, despite being thrown in this block of code:

```php

 } else if ($val[0] == ':') {
	if ($this->_adapter->supportsParameters('named') === false) {
		/**
		 * @see Zend_Db_Statement_Exception
		 */
		require_once 'Zend/Db/Statement/Exception.php';
		throw new Zend_Db_Statement_Exception("Invalid bind-variable name '$val'");
	}
}

```

The Exception should really say:

<strong>You are trying to use named parameters with an adapter that doesn't support them</strong>

The solution is easy, just switch your adapter from Mysqli to Pdo_Mysql
