---
layout: post
status: publish
published: true
title: Magento Layout ignore="1"
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3013
wordpress_url: http://www.edmondscommerce.co.uk/?p=3013
date: 2012-02-29 17:17:15.000000000 +00:00
categories:
- magento
tags:
- magento
- xml
- ignore
- debug
- layout
- sweet
- tooth
- recaptcha
- fontis
- '1'
- remove
---
If you are looking at your Layout XML when trying to debug missing blocks for example, you may see the attribute ignore="1" being assigned to chunks of XML.

These are set when some module or other is using the remove syntax to remove a block.

For example I have just had some issues with Fontis Recaptcha and TBT Sweetooth extensions not playing nice together.

The reason is that the Fontis extension is removing the entire customer_form_register handle and replacing it with a custom one however the Sweettooth module is still referring to the core Magento handle which then means its layout updates are not having any effect.

The way to see this is find the layout sections with ignore="1" 

```xml

<block type="core/text_list" name="left" as="left" ignore="1"/>

```

and search your files for a corresponding

```xml

<remove name="left"/>

```

The name attribute is the one you need to look for the correlation on.

For the sweettooth issue, the solutions was to simply add in the sweet tooth XML to the Fontis XML like this:

```xml

    <customer_account_create>
        <remove name="customer_form_register"/>

        <reference name="content">
            <block type="customer/form_register" name="recaptcha_form_register" template="fontis/recaptcha/register.phtml">
                <block type="core/template" name="recaptcha.box" as="recaptcha_box" template="fontis/recaptcha/recaptcha.phtml"/>
                <block type="rewardsref/field_register" name="rewards_referral" template="rewardsref/customer/register/fieldset.phtml" />
            </block>
        </reference>
    </customer_account_create>

```

Inspiration from this <a href="http://stackoverflow.com/questions/1087733/magento-my-account-layout-xml-problem">Stack Overflow</a>
