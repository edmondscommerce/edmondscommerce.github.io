---
layout: post
status: publish
published: true
title: Disable JavaScript alerts for a page
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4485
wordpress_url: http://www.edmondscommerce.co.uk/?p=4485
date: 2013-08-28 09:21:30.000000000 +01:00
categories:
- javascript
tags:
- firefox
- development
- problem
- magento
- chrome
- solution
- script
- tip
---
If you encounter a webpage that is generating a lot of alerts, the following bookmark will prevent them from stealing focus but still allow you to see what is being said.

```js

javascript:alert = function ( text ) { console.log( text ); return true; };

```
