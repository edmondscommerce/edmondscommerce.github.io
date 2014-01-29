---
layout: post
status: publish
published: true
title: Magento Detailed Exception Dump - Version 3
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2126
wordpress_url: http://www.edmondscommerce.co.uk/?p=2126
date: 2011-02-08 13:17:04.000000000 +00:00
categories:
- magento
tags:
- development
- magento
- exception
- debugging
- dump
- trace
- detailed
- mage.php
- statck
---
Continuing with trying to improve the developer experience with Magento a key element has been my quest for a detailed exception dump that can also handle the various object recursion issues in Magento that can cause all kinds of issues when developing.

Here is my most up to date version of the detailedExceptionDump method.

Its designed to go into a customised version of Mage that you should ONLY use on development environemnts. I will leave the particular usage of this method to you, though it would make sense to also modify the printException method as a starting point.

<script type="text/javascript" src="http://snipt.net/embed/a72f23e55dd732511c71a0d72260ab8b"></script>
