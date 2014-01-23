---
layout: post
status: publish
published: true
title: Magento Template Path Hints in Admin - Updated
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2231
wordpress_url: http://www.edmondscommerce.co.uk/?p=2231
date: 2011-04-21 14:46:14.000000000 +01:00
categories:
- magento
tags:
- magento
- path
- admin
- template
- hints
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
A while ago we posted a technique for displaying template path hints in admin which involved running a couple of DB queries. That worked, but a nicer method is to create a custom module with some special XML config to get it configurable as standard.

```

<?xml version="1.0"?>
<config>
    <sections>
        <dev translate="label" module="core">
            <groups>
                <debug translate="label">
                    <fields>
                        <template_hints translate="label">
                            <frontend_type>select</frontend_type>
                            <source_model>adminhtml/system_config_source_yesno</source_model>
                            <sort_order>20</sort_order>
                            <show_in_default>1</show_in_default>
                            <show_in_website>1</show_in_website>
                            <show_in_store>1</show_in_store>
                        </template_hints>
                        <template_hints_blocks translate="label">
                            <label>Add Block Names to Hints</label>
                            <frontend_type>select</frontend_type>
                            <source_model>adminhtml/system_config_source_yesno</source_model>
                            <sort_order>21</sort_order>
                            <show_in_default>1</show_in_default>
                            <show_in_website>1</show_in_website>
                            <show_in_store>1</show_in_store>
                        </template_hints_blocks>
                    </fields>
                </debug>
            </groups>
        </dev>
    </sections>
</config>

```

Original credits and full instructions here:
<a href="http://www.deanoj.co.uk/web-development/magento/magento-template-path-hints-in-adminhtml/">http://www.deanoj.co.uk/web-development/magento/magento-template-path-hints-in-adminhtml/</a>

Cheers Deano :)
