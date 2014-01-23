---
layout: post
status: publish
published: true
title: Prevent zooming in a mobile browser
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4433
wordpress_url: http://www.edmondscommerce.co.uk/?p=4433
date: 2013-07-26 14:09:53.000000000 +01:00
categories:
- css
tags:
- html
- web design
- web
- design
- mobile
- css
---
It may some times be necessary to prevent a user from zooming in on a mobile browser.

This can be done with the following meta tag

```html

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

```
