---
layout: post
status: publish
published: true
title: Flushing Zend Framework
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 359
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=359
date: 2009-04-28 13:56:31.000000000 +01:00
categories:
- zend framework
tags:
- flush
- zend framework
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I have recently been messing around trying to figure out the best way of running long processes within a Zend Framework App.

Usually I would code in regular flush(); commands to make sure that the browser didnt time out and also that the user can see that something is happening. 

However, the standard MVC structure of the default ZF application system wraps the entire response in an output buffer which is only flushed once everything is done. This has lots of advantages including allowing to add extra headers (FirePHP) on the fly throughout the application process.

For long running scripts though, it is important for me to flush output. My solution to this is twofold.

Firstly set up an 'output' action in my base controller. The output action is looking for an 'act' parameter in its view script. This act param is then used to generate a url string based on the current controller and the action as the act param. This url string is then used to create an iframe which will be used to output the flushing results of the long running script.

For the long running script action itself, I am going to disable layout and also disable view render. Its really important to switch both of these off.

The following needs to be declared at the top of any action that you intend to be viewed via the output iframe.
```php

    // accessed via output action
    public function longrunningAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        $this->_model->grabImages();
    }

```

Now I am free to echo out basic HTML and also call flush from within my model. To flush the output you need to call both ob_flush() and then flush(). To make this easier I set up a static method in my static Tools class

```php

    public static function flush(){
        ob_flush();
        flush();
    }

```

One issue I have had though is that any time the ZF internals try to add a header, you will get a basically meaningless exception telling you that headers have already been sent. It doesn't tell you what header was attempted to be added or why, so you can be left out in the cold a bit when trying to debug.

If anyone knows a good workaround for this, or can offer a better solution for handling these long running processes I would love to hear about it.<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://health.nicheultra.com/2009/04/28/gall-bladder-liver-flush/" rel="nofollow">How Healthy Are You? » Gall Bladder Liver <b>Flush</b></a><br><a href="http://www.acaiberrybase.com/power-flush-500/" rel="nofollow">Power <b>Flush</b> 500</a><br><a href="http://www.tenteges.com/uncategorized/flush-with-class-tenn-bathroom-voted-best-in-us-ap" rel="nofollow"><b>Flush</b> with class: Tenn. bathroom voted best in US (AP) : TENTEGES</a><br><a href="http://groaner.gophercentral.com/?p=301" rel="nofollow">The Daily Groaner » Blog Archive » <b>Flush</b> The Toilet</a><br><a href="http://blog.arcadianlighting.com/plc-lighting-flush-mount-ceiling-light-available-finish/" rel="nofollow">PLC Lighting <b>flush</b> mount ceiling light available finish | Lighting <b>...</b></a><br><a href="http://www.gsdesign.ro/blog/zend-framework-losing-session-on-swfflash-upload/" rel="nofollow"><b>zend framework</b> losing session on swf/flash upload | GS Design</a><br><a href="http://blog.ekini.net/2009/03/04/zend-framework-connecting-to-2-databases/" rel="nofollow"><b>Zend Framework</b>: Connecting to 2 databases | eKini: Web Developer Blog</a><br><a href="http://blog.ekini.net/2009/03/03/extending-the-models-in-zend-framework-better-readability-easier-to-maintain/" rel="nofollow">Extending the Models in <b>Zend Framework</b> = Better readability + <b>...</b></a><br></div>
