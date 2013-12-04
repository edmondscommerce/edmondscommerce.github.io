---
layout: post
status: publish
published: true
title: PrestaShop - Session handling
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 4206
wordpress_url: http://www.edmondscommerce.co.uk/?p=4206
date: 2013-03-28 17:13:28.000000000 +00:00
categories:
- prestashop
tags:
- sessions
- prestashop
- tip
- cookie
---
Like most frameworks and software packages PrestaShop has it's own way of handling session variables.

PrestaShop uses the Cookie class to manage session variables. While this isn't strictly a singleton you can get a pre initialised instance using Context::getContected->cookie if the FrontController->init() method has been called already.

The Cookie class uses the magic __get __isset __set __unset magic methods to handle parameters. Parameters set in the cookie are actually given to the client in an encrypted blob. This is good because it means sessions are not really stored on the server. This does mean, however, that only scalar values can be stored in the session. To store non-scalar values you can usually get away with serialising them but there are some restrictions even then. If you do struggle to store serialised values you can base64 encode them to fix any remaining issues.

Once you have set your variables you need to call the write method to save your variables to the cookie.
