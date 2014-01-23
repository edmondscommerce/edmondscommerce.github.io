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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
