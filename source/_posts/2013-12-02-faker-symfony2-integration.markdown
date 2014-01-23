---
layout: post
title: "Faker Symfony2 Integration"
date: 2013-12-02 20:43:49 +0000
comments: true
author: joseph
categories: 
 - symfony2
tags: 
 - symfony2
 - faker
 - fixtures
 - test
 - tdd
description: "How to easily generate test data using the Faker library in your Symfony2 Project"
---

Generating test data is a crucial part of properly testing your code. If you have to hard code your test data or fixtures then you might be tempted to use only a small number of test entities.

To help with this you can use the brilliant [Faker](https://github.com/fzaninotto/Faker) library to generate your test data. The Faker library is designed purely to generate test data and has a range of providers for all kinds of data.

As if that wasn't good enough, you can leverage all the power of this library in your Symfony2 development by simply installing this Symfony2 bundle, [BazingaFakerBundle](https://github.com/willdurand/BazingaFakerBundle/blob/master/Resources/doc/index.md).

Installation is a breeze with Composer and then simply reference your entities in the configuration and run the command

```
app/console faker:populate
```

To generate your entities programmatically rather than as a command line action (perhaps as part of a unit or functional test) you can use this code:

``` php
//Faker load test data
$populator = $this->getContainer()->get('faker.populator');
$insertedPks = $populator->execute();
foreach ($insertedPks as $class => $pks) {
    $reflClass = new \ReflectionClass($class);
    $shortClassName = $reflClass->getShortName();
    printf("\nFaker: Inserted %s new %s objects\n", count($pks), $shortClassName);
}

```
