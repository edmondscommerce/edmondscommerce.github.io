---
layout: post
status: publish
published: true
title: Calling Methods from a Magento Static Block
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3329
wordpress_url: http://www.edmondscommerce.co.uk/?p=3329
date: 2012-08-22 11:47:06.000000000 +01:00
categories:
- magento
tags:
- development
- php
- problem
- magento
- cms
- ecommerce
- solution
- tip
- static blocks
---
I recently had to develop a bespoke CMS within magento. 

One of the requirements was that the system should be very easy to customise, and should use the existing Pages and Static blocks functionality within magento.

I wanted the ability to call a block that I had created from with a static block. Magento allows you to do this using the code below
<code>
{{block type='companyname/path_to_block' name='custom.block' template='path/to/template/file.phtml'}}
</code>

The issue that I came across if you need to call a method on the block before it is rendered. If I was calling the block using XML I could use the action tag, but that is not avalible here.

However, it is possible to call certain methods using the code above. The magento parser takes each of the pair values and calls a set method on them, so for example template='path...' actually calls the setTemplate method on your block.

This means that you can create a set method and trigger it from with in the static block like so

<code>
{{block type='companyname/path_to_block' name='custom.block' template='path/to/template/file.phtml' methodName="3"}}
</code>

