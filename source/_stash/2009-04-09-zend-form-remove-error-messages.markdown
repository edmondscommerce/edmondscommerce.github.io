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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://zendguru.wordpress.com/2009/04/02/zend-framework-using-json-and-prototype-for-filling-form-on-fly/" rel="nofollow"><b>Zend</b> Framework: using JSon and Prototype for filling <b>form</b> on fly <b>...</b></a><br><a href="http://zendguru.wordpress.com/2009/03/04/zend-framework-creating-custom-zend-form/" rel="nofollow"><b>Zend</b> Framework: Creating custom <b>Zend form</b> « <b>Zend</b> Framework</a><br><a href="http://zendguru.wordpress.com/2008/12/05/grouping-form-errors-for-display-purpose/" rel="nofollow">Grouping Form errors for display purpose in Zend Framework</a><br><a href="http://zendguru.wordpress.com/2008/12/04/handling-zend-framework-form-error-messages/" rel="nofollow">Handling Zend Framework Form error messages</a><br><a href="http://zendguru.wordpress.com/2009/02/10/zend-framework-dojo-form-decorators-example-and-usage/" rel="nofollow"><b>Zend</b> Framework Dojo <b>Form</b> decorators example and usage « <b>Zend</b> Framework</a><br><a href="http://zendguru.wordpress.com/2008/12/04/handling-zend-framework-form-error-messages/" rel="nofollow">Handling Zend Framework Form <b>error messages</b></a><br><a href="http://libertini.net/libertus/2009/03/11/playing-with-zend-framework/" rel="nofollow">Playing with Zend Framework</a><br><a href="http://zendguru.wordpress.com/2008/12/05/grouping-form-errors-for-display-purpose/" rel="nofollow">Grouping <b>Form</b> errors for display purpose in <b>Zend</b> Framework « <b>Zend</b> <b>...</b></a><br><a href="http://www.naumann.cc/?p=24" rel="nofollow">Installing apache 2.2, proftpd, fcgi and mysql</a><br><a href="http://ec2-174-129-218-53.compute-1.amazonaws.com/archives/soap-xmlrpc-and-rest-with-the-zend-framework/" rel="nofollow">Soap, XmlRpc, PHP, Rest API, Trading, ZF, <b>Zend</b> Framework <b>...</b></a><br></div>
