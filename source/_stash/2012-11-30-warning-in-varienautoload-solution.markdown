---
layout: post
status: publish
published: true
title: Warning in Varien/Autoload + Solution
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3720
wordpress_url: http://www.edmondscommerce.co.uk/?p=3720
date: 2012-11-30 17:46:34.000000000 +00:00
categories:
- magento
tags:
- problem
- magento
- solution
- helpful tips
- autoloader
---
I have recently been putting together a system that needed to interact with Magento.

A big issue that I came across was a warning similar to this 

<code>
Warning: include(): Failed opening 'Model/Base.php' for inclusion (include_path='...') in /path/to/magento/lib/Varien/Autoload.php on line 93 
</code>

As I was running with an error handler that turned all errors into exceptions this prevented the code from running.

The issue was due to my code using a custom autoloader, and when the Varien auto-loader was called first it could not find the files which triggered a warning.

There are multiple ways of getting round this - see <a href="http://stackoverflow.com/questions/4085967/how-to-integrate-ezcomponents-with-magento" title="How To Integrate Ezcomponents With Magento">here</a> for an example - if you are using PHP 5.3+ there is a much simpler solution. 

Since PHP 5.3 the spl_autoload_register has had a prepend option which places the autoloader at the top of the stack. This means that it will try your autoloader first, rather than the Varien one, avoiding the warning if the file can only be found using your autoloader. To do this just use the following command

```php

spl_autoload_register('my_autoloader',null,true);

```
