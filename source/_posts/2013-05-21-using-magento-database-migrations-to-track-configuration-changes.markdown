---
layout: post
status: publish
published: true
title: Using Magento Database Migrations to Track Configuration Changes
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4267
wordpress_url: http://www.edmondscommerce.co.uk/?p=4267
date: 2013-05-21 09:11:44.000000000 +01:00
categories:
- magento
tags:
- magento
- migration
- version control
- database
- configuration
- update
- install
- script
- deployment
- staging
- production
---
Often when working on a Magento site, there is a requirement to build custom functionality or implement new themes etc but to finish the job, the final step will be to perform some admin configuration.

This manual step can introduce the possiblity of human error if a step is missed or not performed exactly correctly.

Also if the configuration is to be applied multiple times across staging, pre production and final production then these risks increase.

The only sure way to make sure that the correct configuration is applied and also to provide a proper audit trail for configuration changes is to use Magento's database migrations - install and upgrade scripts - to update the database programmatically with the required configuration changes.

To assist with this, there is a nice simple module you can find on Git Hub:

<a href="https://github.com/danslo/MigrationHelper">https://github.com/danslo/MigrationHelper</a>

This module will automatically create the migration files for you which can be a real time saver. 

I would always suggest you create your own custom namespaced configuration migration module that is purely to track these configuration changes.
