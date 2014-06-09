---
layout: post
status: publish
published: true
title: Zend Dojo Form Input Size + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 436
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=436
date: 2009-06-09 08:06:03.000000000 +01:00
categories:
- zend framework
tags:
- zend framework
- dojo
- form
- size
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
<b>Problem:</b>
You are dutifully setting your size attribute in your Zend Form class and you input elements are being rendered with that size attribute. However if Javascript is enabled and you are using Dojo for your forms, the size attribute gets dropped. 

<b>Solution:</b>
To set the width on dojo form elements you must use the width css operator. eg
```php

$form->getElement('blah')->setAttrib('style'=>'width: 50em;');

```

So simple once you know how!
 
