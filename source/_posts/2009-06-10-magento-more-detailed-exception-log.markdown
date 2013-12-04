---
layout: post
status: publish
published: true
title: Magento More Detailed Exception Log
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 439
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=439
date: 2009-06-10 12:52:59.000000000 +01:00
categories:
- magento
tags:
- magento
- exception
- logging
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Magento has a nice feature which logs exceptions to file and then generally displays a non scary message to the site user. Its not always true, some exceptions do get through and then generate reports.

For exceptions that are caught and logged though, (if you have logging enabled) you will find the exception log in the var/logs folder. However the exception log only contains the getTraceAsString info, which is heavily truncated and often pretty much useless. To get around this you can modify the logException method in Mage.php.

Note, editing Mage.php directly is not generally a good idea and any edits will get nuked every time you upgrade. However for local development work this little edit is OK I think.

```php

 public static function logException(Exception $e)
    {
        if (!self::getConfig()) {
            return;
        }
        $file = Mage::getStoreConfig('dev/log/exception_file');
        //self::log("n".$e->getTraceAsString(), Zend_Log::ERR, $file);
        $exceptionString = "nnnLogged Exception:nn" . $e->getMessage() . "nn" . $e->getTraceAsString();
        /*foreach($e->getTrace() as $t){
            $exceptionString .= var_export($t, true);
        }*/
        self::log($exceptionString, Zend_Log::ERR, $file);
    }

```

Note I experimented with echoing out each trace as detailed in <a href="http://www.edmondscommerce.co.uk/blog/zend-framework/zend-framework-more-detailed-stack-trace/">this post</a>, however I found that this caused a fatal error due to some kind of recursion so I have commented it out. The only real change is that I have logged also the Exception message, which is generally the most useful bit of info and will actually help you understand what has gone wrong, in which file and on which line.

Hope this helps someone else out. If you have any suggestions on a cleaner or better way to do this please do post it / link it in the comments.<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.yogabin.com/blog/2009/06/08/its-cool-to-be-healthy-again-the-exception-magazine/" rel="nofollow">It&#39;s Cool To Be Healthy Again - The <b>Exception</b> Magazine « Yoga Bin Blog</a><br><a href="http://www.caktusgroup.com/blog/2009/06/09/remote-logging-with-python-logging-and-django/" rel="nofollow">Caktus Blog » Blog Archive » Remote <b>logging</b> with Python <b>logging</b> <b>...</b></a><br><a href="http://www.aspirationhosting.net/?p=227" rel="nofollow">Aspiration Hosting (MY &amp; US)</a><br><a href="http://www.offshoresoftwaredevelopmentindia.com/blog/2009/05/01/magento-the-radical-ecommerce-open-source/" rel="nofollow"><b>Magento</b> - The radical Ecommerce open source | Blog| Offshore <b>...</b></a><br><a href="http://www.magento.cn/127/magento-shopping-cart/ebook-magento-use-guilde-developing-for-magento/" rel="nofollow">Ebook <b>Magento</b> Use Guilde-Developing For <b>Magento</b>, <b>Magento</b> design <b>...</b></a><br><a href="http://www.templates.com/blog/free-magento-themes-for-your-web-store/" rel="nofollow">Free <b>Magento</b> Themes for Your Web Store! | Templates.com</a><br></div>
