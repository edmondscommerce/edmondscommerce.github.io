---
layout: post
title: "SUPEE-3941 - A new patch for Magento Community 1.6, 1.7, 1.8 and 1.9; Enterprise 1.11, 1.12, 1.13 and 1.14"
date: 2015-02-11 10:54:06 +0000
comments: true
author: kenneth
categories: 
 - magento
tags: 
 - magento
 - security
 - patch
description: Magento has released a security patch for a vulnerability which allows remote execution of arbitrary code
---

Magento has become aware of a vulnerability requiring patching as soon as possible. The vulnerability allows an attacker to send a specially crafted request to a Magento store and allow it to run Magento code as though it were on the live server. Magento aren't aware of this having been used in the wild, but now that the vulnerability is public, attackers may use it against existing stores.

This vulnerability affects all versions of Magento, and Magento have released patches for versions Community Edition 1.6 to 1.9, and Enterprise 1.11 to 1.14.

The fix is to apply some stricter IP address checks to requests.

###Patching your Magento store

To get the patch:

*Note: at time of writing, the Downloads of the CE edition seems to under heavy load and is currently presenting a white page instead of the shell file*

- **Community Edition** users should go to the [Magento downloads page](http://www.magentocommerce.com/download) and scroll to the "Magento Community Edition Patches" section. From there, select your version of Magento and click Download
- **Enterprise Edition** users should log into their Magento account Magento Support Portal

You'll be presented with a shell file which will make the necessary changes to your store. Upload this patch to your server in the Magento root and run it against your store.

The patch changes core files, and it's always recommended to test changes on a development copy before the live site, especially if you have modifications to your core code. Also keep in mind that any upgrades pre-1.9.0.1 will remove these changes, and the patch will have to be re-run.

1. `cd /your/magento/root/` - Navigate to the root of Magento
- `./sh PATCH_SUPEE-5344_CE_1.8.0.0_v1.sh` - Run the patches
- `rm PATCH_SUPEE-5344_CE_1.8.0.0_v1.sh` - Delete the patch file, so that it can't be re-run by the public
- `rm -rf var/cache/*` - Clear Magento's cache

Reload a page and the patch will have taken effect.
