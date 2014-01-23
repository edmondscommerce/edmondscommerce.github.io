---
layout: post
status: publish
published: true
title: Magento Transactional Email Codes - Custom Emails
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2130
wordpress_url: http://www.edmondscommerce.co.uk/?p=2130
date: 2011-02-10 13:57:50.000000000 +00:00
categories:
- magento
tags:
- development
- magento
- custom
- module
- email
- transactional
- invalid
- code
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to send some custom emails as part of a custom Magento module development project, you will stumble into the Magento email template system and its confusing mixture of XML requirements.

Rather than go into too much detail here are some pointers about how to achieve what you want to do.

1. You need to set up your admin options in your system.xml file.

I'm not going to go into the details on how to set up custom admin configuration, for that try <a href="http://www.magentocommerce.com/wiki/5_-_modules_and_development/admin/xml_structure_for_admin_configurations">here</a>.

Lets assume you have a custom module under the xml path:

config/sections/custom_module/groups/email/template

that section should look something like this:

```xml

<template translate="label">
	<label>Custom Email Template</label>
	<frontend_type>select</frontend_type>
	<source_model>adminhtml/system_config_source_email_template</source_model>
	<sort_order>2</sort_order>
	<show_in_default>1</show_in_default>
	<show_in_website>1</show_in_website>
	<show_in_store>1</show_in_store>
</template>

```

You need to set your default value in your config.xml file (inside the root config tag)
```xml

 <!-- DEFAULTS For Admin System Configuration //-->
    <default>
        <custom_module>
            <email>
                <enabled>1</enabled>
                <template>custom_module_email_template</template>                
                <identity>sales</identity>
            </email>
        </custom_module>
    </default>

```

Now you also need to define your email template, which goes inside the config/global/ node

```xml

       <!-- EMAIL TEMPLATE //-->
        <template>
            <email>
                <custom_module_email_template translate="label" module="appliedsb">
                    <label>Custom Template</label>
                    <file>appliedsb/download_links.html</file>
                    <type>html</type>
                </custom_moduel_email_template>
            </email>
        </template>

```

And then you need to make sure you put the email template inside the locale folder, en_us (or other locales as needed).

Now you need to clear cache and I recommend resaving the custom configuration group in the admin and double check that your Custom Template label is appearing properly in the email templates dropdown for your module.

And that should be it, your module now has a custom email template that has a locale file and is also over rideable with Magento's own transactional emails system - sweet!

If you get the exception <strong>Invalid transactional email code:</strong> then double check that all your xml nodes match up and that the locale file is in the correct place, clear your cache, resave the admin config and try again. This bug can be tricky to track down but if you respect the above xml and file layout it should all work.
