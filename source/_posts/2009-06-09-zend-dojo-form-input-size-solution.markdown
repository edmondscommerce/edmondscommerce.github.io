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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.digitalsanctuary.com/tech-blog/general/why-i-like-jquery-over-dojo.html" rel="nofollow">Why I like jQuery (over <b>Dojo</b>) | Devon Hillard Tech Blog</a><br><a href="http://writerjoshuajames.com/dailydojo/?p=1379" rel="nofollow">Daily <b>Dojo</b> of Joshua James » Blog Archive » Openings, Part 2</a><br><a href="http://shaneosullivan.wordpress.com/2009/06/01/cool-portlets-added-to-dojo/" rel="nofollow">Cool Portlets added to <b>Dojo</b>! « SOS</a><br><a href="http://shaneosullivan.wordpress.com/2009/06/05/dojo-beer-in-dublin-june-6th/" rel="nofollow"><b>dojo</b>.beer() in Dublin June 6th « SOS</a><br><a href="http://dojocampus.org/content/2009/05/28/dojobeer-barcelona-june-17th/" rel="nofollow">DojoCampus » Blog Archive » <b>Dojo</b>.beer() - Barcelona, June 17th</a><br><a href="http://witdodo.com/how-to-make-contact-form-in-wp" rel="nofollow">how to make contact <b>form</b> in WP | My Life | My Journey</a><br><a href="http://informationideas.com/news/2009/06/08/google-maps-info-window-size-problem-with-images/" rel="nofollow">Tech Blog » Blog Archive » Google maps info window <b>size</b> problem <b>...</b></a><br><a href="http://www.greenrep.net/nearby-wind-farm-may-double-in-size-pantagraph/" rel="nofollow">Nearby wind farm may double in <b>size</b> - Pantagraph | The Green Report</a><br><a href="http://www.gsdesign.ro/blog/zend-framework-losing-session-on-swfflash-upload/" rel="nofollow"><b>zend framework</b> losing session on swf/flash upload | GS Design</a><br><a href="http://blog.ekini.net/2009/03/04/zend-framework-connecting-to-2-databases/" rel="nofollow"><b>Zend Framework</b>: Connecting to 2 databases | eKini: Web Developer Blog</a><br><a href="http://blog.ekini.net/2009/03/03/extending-the-models-in-zend-framework-better-readability-easier-to-maintain/" rel="nofollow">Extending the Models in <b>Zend Framework</b> = Better readability + <b>...</b></a><br></div>
