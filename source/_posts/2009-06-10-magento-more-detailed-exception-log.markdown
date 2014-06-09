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

Hope this helps someone else out. If you have any suggestions on a cleaner or better way to do this please do post it / link it in the comments. 
