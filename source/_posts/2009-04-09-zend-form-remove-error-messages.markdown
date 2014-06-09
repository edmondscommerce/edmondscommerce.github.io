---
layout: post
status: publish
published: true
title: Zend Form Remove Error Messages
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 311
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=311
date: 2009-04-09 07:59:24.000000000 +01:00
categories:
- zend framework
tags:
- zend form
- zend subforms
- zend form remove error messages
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Sometimes you don't want to display the error messages for a form. I have tried to find the proper solution to remove validtion error messages and haven't found what I would regard as the proper solution. 

However what does work for me is to loop through any elements that I want to remove the error messages for and remove the error message decorator like this:

```php

 foreach($subforms['empty'] as $sf){
 	$elements = $sf->getElements();
        foreach($elements as $e){
        	$e->removeDecorator('Errors');
	}
}

```

In this context I have filtered out all the subforms where all inputs are empty and will then remove the error messages from those sub forms.

If you are interested, here is the method I use to validate subforms and separate out valid, invalid and totally empty sub forms.

```php

public function validateSubForms($data){
	$subforms = $this->getSubForms();
	foreach($subforms as $sf){
		if($sf->isValid($data)){
			$valid[]=$sf;
		}else{
			$error_other_than_empty = false;
			$elements = $sf->getElements();
			foreach($elements as $e){
				$errors = $e->getErrors();
				foreach($errors as $er){
				   // EC_Debug::diedump($er);
					if($er !='isEmpty'){
						$error_other_than_empty = true;
						break(2);
					}
				}
			}
			if($error_other_than_empty){
				$invalid[]=$sf;
			}else{
				$empty[]=$sf;
			}
		}
	}
	return array(
		'valid' => $valid,
		'empty'=>$empty,
		'invalid' => $invalid
	);
}

```
 
