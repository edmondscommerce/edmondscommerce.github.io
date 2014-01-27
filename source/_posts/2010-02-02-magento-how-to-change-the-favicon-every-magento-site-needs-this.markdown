---
layout: post
status: publish
published: true
title: Magento How to Change the Favicon
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1347
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1347
date: 2010-02-02 18:35:52.000000000 +00:00
categories:
- magento
tags:
- magento
- favicon
---
Every Magento based site I seem to look at is still using the default Magento favicon.

Whilst its cool to advertise that you are using Magento, perhaps you should be advertising your own business!

Its actually very easy to do - here's a step by step guide:

<strong>1. Create your Favicon.</strong>

First create a roughly square image with your logo in it, then upload it here to create your favicon itself:

http://tools.dynamicdrive.com/favicon/

<strong>2. Find the path to your Favicon.</strong>

All you need to do is go to your home page, view source and look for two lines like this:

```html

<link rel="icon" href="http://www.******.co.uk/skin/frontend/****/****/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://www.****.co.uk/skin/frontend/****/****/favicon.ico" type="image/x-icon" />

```

You now know where your favicon is being stored on your server.

<strong>3. Upload your Icon</strong>

Fire up your favourite FTP client, connect to your server, browse to the path you go from above skin/frontend/****/****/

Now rename the favicon that is up there to favicon.ico.backup

Now upload your custom one.

<strong>4. Check it out</strong>

Just reload your page. Note you may need to clear cache for the new favicon to display properly.
