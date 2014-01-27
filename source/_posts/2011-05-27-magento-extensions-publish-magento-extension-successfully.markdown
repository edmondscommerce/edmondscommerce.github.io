---
layout: post
status: publish
published: true
title: Magento Extensions - Publish Magento Extension Successfully
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2272
wordpress_url: http://www.edmondscommerce.co.uk/?p=2272
date: 2011-05-27 11:48:41.000000000 +01:00
categories:
- magento
tags:
- magento
- connect
- extension
- publish
---
If you have just created your Magento extension but you are now wondering how you can successfully publish it to the community then this article is for you!!

Magento-Connect is an official "repository" for all Magento extensions and a better place where developers can add custom extensions or plugins for community or commercial use.

However, publishing or registering your extension on Magento Connect can sometimes be a pain especially if it is your first ever time to do so. Publishing your extension incorrectly can easily result to unexpected results notably upgrading someone's entire site 

I will definitely recommend packaging your extension on Magento 1.5.x.x as the packaging tool there seems to be well improved compared to the previous versions.

Lets get things started:

Login to admin and go to System -> Magento Connect -> Package Extensions

Once there, please follow the following steps.

<h2>Package Info:</h2>
Here is where you will need to provide the details of your extension.
{% img  /assets/Packaging_info-300x296.png %}

<b>The supported release works like this.</b>
	<ul>
<li>If you want your extension to only work on Magento version 1.5.x.x and above (Select 1.5.0.0 & later)</li>

	<li>If you want to support previous versions as well you will need to select Pre-1.5.0.0 (Magento will automatically create the URL for version 2.0 of the Magento Connect. This will effectively make your extension available for later versions as well.)</li>

	<li>Name must be the same as the name of your extension.</li>

	<li>License and License URI are the same for most part, unless you want to use a different license.</li>
</ul>

<h2>Release</h2>
Specify your extension release details. Straight forward matters.
{% img  /assets/Screenshot-300x231.png %}

<b>Release Version is the version of your extension.</b>

<h2>Authors</h2>
Here you will need to list the author names of the extension. 
{% img  /assets/Screenshot-1-300x28.png %}

<b>Note:</b> The user field, MUST be the same as the name on your Magento Account. This is NOT your screen name, it is the user name as found in My Account on your Magento account.

<h2>Dependencies:</h2>
Most likely you will only need to specify the PHP versions dependencies. However, if your extension depends on other extensions/packages or other libraries, here is the place for your to specify.

{% img  /assets/Dependence-300x74.png %}

<h2>Contents</h2>
Here is the place you tell Extension packager where the extension files are. Below I specified the relative paths to the target field. 
{% img  /assets/Screenshot-2-300x36.png %}

The path field, is where you will enter the path to the directory of files relative to the Target. The relative folders to the targets are

Magento Local module file:  is app/code/local/
Magento Community module file:  is app/code/community/
Magento Global Configuration:  is app/etc/
Magento Core team module file:  is app/code/core/
Magento User Interface (layouts, templates):  is app/design/
Magento PHP Library file:  is lib/
Magento Locale language file:  is app/locale/
Magento Media library: is media/
Magento Theme Skin (Images, CSS, JS):  is skin/
Magento Other web accessible file:  is /
Magento PHPUnit test: is tests/
Magento other: is /

You are now ready to package your extension. Press the Save Data and Create Package button at top right of the page.

Depending on the supported release choice you have made in the first step, your extension files will be in the following location
<b>Release 1.5.0.0 & later: var/connect

Release Pre-1.5.0.0 : var/pear</b>

<h2>Possible Gotchas / Errors</h2>

<b>Release file already exists:</b>
If you get this error: Simply increase the version of the package, re-save the extension and upload it again.

<b>Release refered to unknown or non-existent extension </b>
The package name in package info section MUST be the same as the name of your package. 

I hope you find this article helpfully. 

If you have any question or feedback please feel free to drop a comment with your own experience.
