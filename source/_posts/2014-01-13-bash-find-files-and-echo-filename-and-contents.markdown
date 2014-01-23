---
layout: post
title: "Bash Find Files and Echo Filename and Contents"
date: 2014-01-13 17:18:55 +0000
comments: true
author: joseph
categories: 
 - bash
tags: 
 - bash
 - linux
 - find
 - cat
 - echo
description: "How to use the BASH find command and then echo both the filename and the file contents in one command"
---

I thought this one would be easy but actually its taken a bit of messing about. 

The goal was to find files matching a pattern, in this case a file name, and then echo out the full path to the file and also the file contents.

If you are interested, the reason I was doing this was to understand the *interesting* approach that the ORO Platform has taken to setting up the AppKernel bundles in Symfony2.

The command is here:

```
 find . -type f -iwholename '*bundles.yml' | xargs -I % bash -c "echo ''; echo '----------------------'; echo %; cat %; echo '';"
```

I have added in some extra echos to make it format nicely but the main thing is that I am using xargs to handle the results from find.

The individual result is assigned to the % character. Then a sub shell is instantiated to manage a specific command that both echos % itself and then uses cat to echo the contents of %.

This gave me an output like this:

```
----------------------
./vendor/oro/platform/src/Oro/Bundle/ImportExportBundle/Resources/config/oro/bundles.yml
bundles:
    - Oro\Bundle\ImportExportBundle\OroImportExportBundle

----------------------
./vendor/oro/platform/src/Oro/Bundle/PlatformBundle/Resources/config/oro/bundles.yml
bundles:
    - { name: Symfony\Bundle\FrameworkBundle\FrameworkBundle, priority: -255 }
    - { name: Symfony\Bundle\SecurityBundle\SecurityBundle, priority: -250 }
    - { name: Symfony\Bundle\TwigBundle\TwigBundle, priority: -245 }
    - { name: Symfony\Bundle\MonologBundle\MonologBundle, priority: -240 }
    - { name: Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle, priority: -235 }
    - { name: Symfony\Bundle\AsseticBundle\AsseticBundle, priority: -230 }
    - { name: Doctrine\Bundle\DoctrineBundle\DoctrineBundle, priority: -225 }
    - { name: Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle, priority: -220 }
    - { name: Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle, priority: -215 }
    - { name: JMS\SerializerBundle\JMSSerializerBundle, kernel: true, priority: -210 }
    - { name: Knp\Bundle\PaginatorBundle\KnpPaginatorBundle, priority: -205 }
    - { name: Knp\Bundle\MenuBundle\KnpMenuBundle, priority: -200 }
    - { name: FOS\RestBundle\FOSRestBundle, priority: -195 }
    - { name: FOS\JsRoutingBundle\FOSJsRoutingBundle, priority: -190 }
    - { name: Nelmio\ApiDocBundle\NelmioApiDocBundle, priority: -185 }
    - { name: BeSimple\SoapBundle\BeSimpleSoapBundle, priority: -180 }
    - { name: Stof\DoctrineExtensionsBundle\StofDoctrineExtensionsBundle, priority: -175 }
    - { name: Escape\WSSEAuthenticationBundle\EscapeWSSEAuthenticationBundle, priority: -170 }
    - { name: Liip\ImagineBundle\LiipImagineBundle, priority: -165 }
    - { name: Genemu\Bundle\FormBundle\GenemuFormBundle, priority: -155 }
    - { name: A2lix\TranslationFormBundle\A2lixTranslationFormBundle, priority: -150 }
    - { name: Lexik\Bundle\MaintenanceBundle\LexikMaintenanceBundle, priority: -145 }
    - Oro\Bundle\PlatformBundle\OroPlatformBundle
```

And you can see that the bundle file I was looking for is in the Platform Bundle.
