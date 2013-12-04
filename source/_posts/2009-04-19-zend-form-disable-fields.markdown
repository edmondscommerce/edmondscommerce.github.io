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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
