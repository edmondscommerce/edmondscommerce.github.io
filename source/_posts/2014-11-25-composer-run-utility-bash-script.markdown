---
layout: post
title: "Composer Run Utility BASH Script"
date: 2014-11-25 09:18:18 +0000
comments: true
author: joseph
categories: 
 - composer
tags: 
 - php
 - bash
 - composer
description: "Check out this little BASH script designed to sit next to your composer.json file and provide a nice utility to install, update and run composer"
---
I thought I would post up this little snippet of BASH script that I tend to use with projects that use composer.

It combines an install/update mechanism for composer itself and then runs through the composer install process and dumps the optimised autoloader.

Hope you find it useful:

``` bash
#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Checking for Composer"
COMPOSER_CMD=$(which composer)
if [[ "" == "$COMPOSER_CMD" ]]
then
    echo "Installing Composer"
    curl -sS https://getcomposer.org/installer | php -- --install-dir=bin
    COMPOSER_CMD=$(which composer)
else
    echo "Updating Composer"
    $COMPOSER_CMD selfupdate
fi
echo "Running Composer"
cd $DIR
$COMPOSER_CMD update
$COMPOSER_CMD dumpautoload -o
echo "Done.."


```
