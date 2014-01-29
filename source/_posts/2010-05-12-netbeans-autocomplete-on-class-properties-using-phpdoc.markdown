---
layout: post
status: publish
published: true
title: Netbeans Autocomplete on Class Properties Using PHPDoc
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1648
wordpress_url: http://www.edmondscommerce.co.uk/?p=1648
date: 2010-05-12 11:26:41.000000000 +01:00
categories:
- netbeans
tags:
- php
- netbeans
- object
- autocomplete
- phpdoc
- class
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are using netbeans for PHP classes and you have some of your class properties are instances of other objects and you want to get autocomplete working for them, then you might struggle to figure out which PHPDoc syntax to use to get autocomplete working. 

Here is the answer:

```php

/**
* @property MyObject $myObject
* @property AnotherObject $anotherObject
*/
class MyClass{

     protected $myObject;
     protected $anotherObject;
     
     public function __construct($myObject, $anotherObject){
         $this->myObject=$myObject;
         $this->anotherObject=$anotherObject;
     }
     
     public function autocomplete(){
         $this->myObject->//autocomplete works here
     }
     
}

```

