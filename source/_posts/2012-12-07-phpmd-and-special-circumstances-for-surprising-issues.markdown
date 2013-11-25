---
layout: post
status: publish
published: true
title: PHPMD and Special Circumstances for Surprising Issues
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 3740
wordpress_url: http://www.edmondscommerce.co.uk/?p=3740
date: 2012-12-07 16:23:35.000000000 +00:00
categories:
- php
tags:
- development
- php
- phpmd
---
PHPMD is useful as it helps keep coding problems to a minimum. There are some esoteric circumstances where it will flag up issues that while they are issues there is no good way to avoid them.

Consider the following code block which is overriding a method from a parent class:

```php

<?php
class ExportSpecial extends Export
{
    public function getOrderItemValues($item, $order, $itemInc=1)
    {
        return array();
    }
}

```

With this PHPMD will flag the three unused parameters as an issue.
This is correct because they are unused however it's also incorrect because in this instance the overriding method must accept these parameters to prevent a strict error.
This is one of the limited set of instances where suppressing the issues that PHPMD finds would be correct.
To do this you use the @SuppressWarnings option on the comments block above the method definition. There are many options that are suppressible within PHPMD, the list of errors to suppressible rules can be found here: <a href="http://phpmd.org/rules/index.html">http://phpmd.org/rules/index.html</a>

So in the previous example the following change could be made to stop PHPMD flagging the erroneous issue.

```php

<?php
class ExportSpecial extends Export
{
    /**
     * @SuppressWarnings(PHPMD.UnusedFormalParameter)
     */
    public function getOrderItemValues($item, $order, $itemInc=1)
    {
        return array();
    }
}

```
