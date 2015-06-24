---
layout: post
title: "Adding Code Sniffer with Magento Standards to PHP Storm"
date: 2015-06-24 09:53:52 +0100
comments: true
author: dcallagh
categories: phpstorm 
tags: magento, sniffer, standards, workflow, php
description: Improving coding standards with PHP Storm for Magento
---

Keeping inline with the Magento coding standards is always good practice when working but it can often be hard to
stay on top of it, this is where PHP Code Sniffer comes in.

Lets get setup, firstly if Code Sniffer is installed or not
    yum list installed | grep php

In the list of installed packages check if you can see the following package in the list 
    php-pear-PHP-CodeSniffer.noarch
    
If you can find the package in the list, install it, using sudo if needed
    yum install php-pear-PHP-CodeSniffer.noarch

Finally, a sanity check that every thing is working
    phpcs -v
    #Output
    #Registering sniffs in the PEAR standard... DONE (27 sniffs registered)
    #Creating file list... DONE (0 files in queue)

Now we are ready to go and get our Magento coding standards to use sniffer with, we'll use composer for this
    composer global require "magento-ecg/coding-standard"
    
Installing the package globally is my preferred way of working, the rule set will be used with all my Magento projects
and if I need to update them I only need to update the global composer repository with one command rather than updating
for every single project.

Now it's time to tell PHP Storm where to find our sniffer file.
In PHP Storm go to `settings->Languages & Frameworks->PHP->Code Sniffer`

Under the configuration select menu choose local hit the more (elipsis ...) button then choose to browse to your phpcs
path and browse to your installed sniffer file, in my case the file was located in `/bin/phpcs`.
With this done, hit the validate button and you should see green.

Back on the main settings menu, navigate to `editor->inspections->PHP` and enable the Code Sniffer checkbox if it isn't
already. Choose `custom` as the coding standard and hit the ellipsis (...) button to browse to your intended rule set.

In our case, we installed the Magento rule set earlier to our global composer repository which is located in the
home directory. `/home/<USER>/.composer/vendor/magento-ecg/coding-standard/Ecg`

We're all set to go, in PHP Storm you can now choose to inspect code in various places such as individual files,
the entire project or individual directories. I prefer to stick to the directories that I can currently working with
such as the module within the namespace.
