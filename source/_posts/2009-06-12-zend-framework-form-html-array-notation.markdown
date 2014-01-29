---
layout: post
status: publish
published: true
title: Zend Framework Form HTML Array Notation
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 518
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=518
date: 2009-06-12 14:43:10.000000000 +01:00
categories:
- zend framework
tags:
- zend form
- form array
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
After losing an afternoon trying to get my extended Zend Dojo Form class to give me HTML array notation, I have finally found a solution that works. To celebrate I've decided to share it should anyone else suffer a similar problem.

Here is the method:

```php

public function addSubFormEl($subFormName, $addElOptions){
        call_user_func_array(array($this,'addElement'), $addElOptions);
        $this->getElement($addElOptions[0])->setBelongsTo($subFormName);
    }

```

In one move, this creates the element and assigns it to a HTML array of the name $subFormName. Evidently I am using this with sub forms but there is no reason why you should have to do that.
