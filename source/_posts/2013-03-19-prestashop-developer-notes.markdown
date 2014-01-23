---
layout: post
status: publish
published: true
title: PrestaShop - Developer Notes
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 4158
wordpress_url: http://www.edmondscommerce.co.uk/?p=4158
date: 2013-03-19 17:47:26.000000000 +00:00
categories:
- prestashop
tags:
- development
- php
- developer
- prestashop
- tip
- tips
---
PrestaShop is a fully featured shopping platform and offers much of the functionality that other eCommerce shopping platforms do. Compared to, for example, Magento PrestaShop is significantly simpler to develop for.

Here is the run down of the key aspects that any one building a web site on PrestaShop should be aware of.

<h2>Modules</h2>
PrestaShop is based around a modular design which is quite similar to Joomlas module system.
A modules presence and position on the front end is defined by hooking the module into a particular section on the frontend. There are loads of hooks that can be used. Most modules will add them selves to the hook they think is most appropriate on install. The ordering of modules also defines the order they appear in a given hook.
A key point of managing modules that can easily be over looked is that you can grab and drag modules in a given hook by clicking and holding the position change buttons.

<h2>Themes</h2>
Off the shelf themes are usually not simply a new set of templates and CSS but also modules as well. Quite allot of themes are built around specific modules being in specific hooks some times in a specific order.

<h2>Creating your own module</h2>
Defining your own module is really straight forward:
Create a folder in modules called my_module.
Create a file called my_module.php, in this file create a class called My_module which extends Module.
Create a config.xml with the following template:
<?xml version="1.0" encoding="UTF-8" ?>
<module>
	<name>my_module</name>
	<displayName>My Module</displayName>
	<version>1</version>
	<description>A test module, it does nothing</description>
	<author>My self</author>
	<tab>front_office_features</tab>
	<is_configurable>0</is_configurable>
	<need_instance>1</need_instance>
</module>
Done, the module will appear in the module list but do nothing. You can look at the base module class to see all the function available that get called by PrestaShop are different times to do what you need to do.
