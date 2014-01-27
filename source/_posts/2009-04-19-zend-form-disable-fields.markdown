---
layout: post
status: publish
published: true
title: Zend Form Disable Fields
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 335
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=335
date: 2009-04-19 09:36:53.000000000 +01:00
categories:
- zend framework
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I use this little function as part of my base form class to enable me to easily lock certain form elements.

```php

    public function lockField($field){        
        $elem = $this->getElement($field);        
        $elem->setAttrib('disabled', true);
        $elem->setAttrib('readonly',true);
    }

```

usage might be like the following:
```php

public function makeForm($action){
	$form = new My_Form(array('action'=>$action));
	$form->addElement(.. custom form add element function);
	$form->lockField('fieldname');
	$form->addSubmit(.. custom add submit function);
	return $form;
}

```
