---
layout: post
status: publish
published: true
title: Magento Detailed Exception Log
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1847
wordpress_url: http://www.edmondscommerce.co.uk/?p=1847
date: 2010-10-18 10:20:02.000000000 +01:00
categories:
- magento
tags:
- magento
- error
- stack
- trace
- detailed
- log
---
I have never been a particular fan of PHP's standard stack trace - it tantalises you with a short snippet of info for each step of the trace that always seems to miss off the really useful bit of info.

I have done previous posts before on how to get a more detailed stack trace. If you want to have this in Magento you need to edit Mage.php (I currently don't know a way of overriding Mage.php) with this code (around line 724)

```php

    /**
     * Write exception to log
     *
     * @param Exception $e
     */
    public static function logException(Exception $e)
    {
        if (!self::getConfig()) {
            return;
        }
        $file = self::getStoreConfig('dev/log/exception_file');
        //self::log("\n" . $e->__toString(), Zend_Log::ERR, $file);
        $exceptionDump = "\n\nDETAILED EXCEPTION DUMP\n\n";
		foreach($e->getTrace() as $n=> $t){
			$exceptionDump .= "\n\n------------\n#$n\n" . var_export($t, true) . "\n";
		}
        self::log("\n" . $exceptionDump, Zend_Log::ERR, $file);
    }

```
