---
layout: post
title: "Simple Database Migrations"
date: 2014-04-28 13:22:34 +0100
comments: true
author: joseph
categories: 
 - php
tags: 
 - php
 - database
 - version control
 - deployment
 - mysql
description: "A simple and lightweight database version control system"
---
Some times you just need something simple to manage database versions. This few lines of PHP is something I have used on various projects to assist with database versioning.

It is definitely not a fully featured migrations system, there is no downgrade functionality, it is purely for versioning up a DB to the latest version.

Largely how it works is up to you as it is simply a way of requiring PHP files in numerical order.

Here is the code:

``` php
<?php
$res = mysql_fetch_assoc(db_query("select version from db_migrations order by version desc limit 0,1"));
$current_version = ($res['version']) ? $res['version'] : 0;
$di = new DirectoryIterator(__DIR__ . '/migrations');
$torun = array();
foreach ($di as $f) {
    /* @var $f DirectoryIterator */
    if ($f->isDot()) {
        continue;
    }
    if ('php' == pathinfo($f->getFilename(), PATHINFO_EXTENSION)) {
        $exp = explode('.', strval($f));
        if (2 != count($exp)) {
            throw new Exception('#1 Invalid migration file ' . strval($f) . ' in ' . __FILE__);
        }
        $version = $exp[0];
        if (!is_numeric($version)) {
            throw new Exception('#2 Invalid migration file ' . strval($f) . ' in ' . __FILE__);
        }
        if ($version > $current_version) {
            $torun[$version] = strval($f);
        }
    } else {
        throw new Exception('#3 Invalid migration file ' . strval($f) . ' in ' . __FILE__);
    }
}

if (!empty($torun)) {
    ksort($torun, SORT_NUMERIC);
    foreach ($torun as $v => $t) {
        require(__DIR__ . '/migrations/' . $t);
        h(3, 'Database Migrations - running migration ' . $t);
        db_query("insert into db_migrations set version = '$v' ");
    }
}

```
