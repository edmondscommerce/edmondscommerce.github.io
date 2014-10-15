---
layout: post
title: "Intermittent PayPal IPN failure in Magento"
date: 2014-10-15 09:53:44 +0100
comments: true
author: michael
categories:
 - magento
tags:
 - magento
 - paypal
 - ipn
description: "Looking at intermittent IPN failures in magento"
---

On one or two store we had an issue with intermittent IPN failures. Some paypal orders would be stuck on the 'Pending' status even if there was a sucessful paypal payment. In the exception logs there would be the following exception being thrown 'PayPal IPN postback failure. See paypal_unknown_ipn.log for details.' on line 156 of app/code/core/Mage/Paypal/Model/Ipn.php.

###What the issue turned out to be

The issue turned out to be curl adding in extra error. On occasions curl will send the following header 'Expect: 100'. The idea behind that is that rather than curl just send the data. It will send a inital request just to check if the web server will accept the data. Curl will usually fall on this bahaviour if the request is above a certain size.

It turns out that the magento implementation assumes that the response will be consitant. But with the ocasional 'Expect' header bing in the request this is not always the case.

In the \_postBack method in the IPN class where it makes the curl post back is recived there is the following code near to the end of the method.
``` php
    $response = preg_split('/^\r?$/m', $response, 2);
    $response = trim($response[1]);
```

This code assumes the line position of where the 'VERIFIED' line would occur. To resolve the header issue the following code should be used instead.
``` php
    $response = preg_split('/^\r?$/m', $response);
    $response = trim(end($response));
```

As the 'VERIFIED' line will always be the last line in the response. Regardless of any extra headers being added. This should resolve the issue but of corse remeber to use the local method and copy the class to the local folder with the correct path before doing the modification.
