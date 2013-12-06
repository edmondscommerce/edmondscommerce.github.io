---
layout: post
status: publish
published: true
title: Zend Framework More Detailed Stack Trace
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 369
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=369
date: 2009-04-30 14:50:24.000000000 +01:00
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
If like me you kicked off your Zend Framework experience with the Quick Start and have kept the error controller system of the Quick Start for your other ZF projects, you might find this little snippet useful. 

The Quick Start uses the Exception::getTraceAsString() method to give you the stack trace. Unfortunately this function seems to snip off a bit of useful info.. almost tantalising you with the info but not quite giving you enough to actually know what is going wrong!

To get a more detailed stack trace, I recommend changing this and using the Exception::getTrace() function which returns and array of the trace. You can then echo out all of this info in full. 

For me (as I have xdebug for my dev environment, which is the only place you should be dumping stack traces anyway) I use the following chunk of code in my views/scripts/error/error.phtml

```php

<? // application/views/scripts/error/error.phtml ?>

<h1>An error occurred</h1> 
<h2><?= $this->message ?></h2> 

<? if ('production' != $this->env): ?>
    <h3>Exception information:</h3> 
    <p> 
        <b>Message:</b> <?= $this->exception->getMessage() ?> 
    </p> 
    <h3>Request Parameters:</h3> 
    <pre><? var_dump($this->request->getParams()) ?></pre>

    <h3>Stack Trace 2:</h3>
    <?php
    foreach($this->exception->getTrace() as $t){
        var_dump($t);
    }
    ?>
<? endif ?>


```
