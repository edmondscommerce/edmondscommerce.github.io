---
layout: post
status: publish
published: true
title: Zend Framework - Reusing Prepared Zend_Db_Statements
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1345
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1345
date: 2010-02-02 15:22:32.000000000 +00:00
categories:
- zend framework
tags:
- performance
- zend framework
- zend_db_statement
- prepared statements
- execute
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you use Zend_Db_Statements directly as well as using the Zend_Db_Table family of classes for Active Record et al then you might find the following little tip useful.

By default, if you run a query using something like

```php

 public function query($sql, $params=false) {
	if(empty($params)) {
		$stmt = $this->getAdapter()->query($sql);
	}else {
		$stmt = $this->getAdapter()->query($sql, $params);
	}
	return $stmt;
}

```

then every time you call your query method, you will be preparing the statement again.

Of course that's not really a good idea if you are repeating the same query multiple times simply changing the parameters to be passed in.

In that kind of scenario you can do something like this:

```php

$stmt = $db->query($sql, $params);
$result1 = $stmt->fetch();
$stmt->execute($params2);
$result2 = $stmt->fetch();

```

Heres an example of a chunk of code that is working out a category path from an ecommerce system for a particular category id.

```php

$stmt = $db->query("select c.parent_id, cd.categories_name from categories c join categories_description cd using(categories_id) 
where categories_id = ?", array($categories_id));
while(false!==($r=$stmt->fetch())){
	$categoryString[]=$r['categories_name'];
	if($r['parent_id']==0){
		break;
	}
//Note this bit - we are just re executing the statement with some new parameters.
	$stmt->execute(array($r['parent_id']));
}

```

This tip alone can add a lot of speed if you are doing repetitive statements

