---
layout: post
title: "Checking for Magento patches with FTP"
date: 2015-07-01 14:59:53 +0100
comments: true
author: dcallagh
categories: 
tags: 
description: 
---

When you have an older version of Magento running on your server it is extremely important to ensure that you stay up to date with the latest security patches.
If you have FTP or Cpanel access (with the file browser) you can quickly and easily check how protected you are.

With your favourite FTP application/CPanel, connect to your site and browser to your root public directory (the part exposed to requests).
From there navigate to Magento's app/etc directory and search for a file called `applied.patches.list`, this file is created following a security patch and will show where the changes have been made.

In this file will be what changes were made, the date and time they were applied as well the patch that was applied.

    2015-04-21 06:34:06 UTC | SUPEE-1533 | EE_1.12 | v1 | _ | n/a | SUPEE-1533_EE_1.12_v1.patch
    patching file app/code/core/Mage/Adminhtml/Block/Dashboard/Graph.php
    patching file app/code/core/Mage/Adminhtml/controllers/DashboardController.php

Refer to the Magento website, the `applied.patches.list` file and your Magento version to find out what needs to be applied as required. 