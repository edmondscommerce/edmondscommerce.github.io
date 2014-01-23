---
layout: post
title: "Wrapping a List in Quotes in PHPStorm"
date: 2013-12-06 11:35:58 +0000
comments: true
author: joseph
categories: 
 - phpstorm
tags: 
 - php
 - phpstorm
 - regex
 - find
 - replace
description: "A quick tip showing how to use PHPStorms's regex replace functionality to wrap all the elements of a comma separated list in quotes"
---

Some times you might find your self with a list of values you want to copy and paste from somewhere into your PHP code as an array of strings.

For example, take this list of carrier names that I need to use:

```
Blue Package, USPS, UPS, UPSMI, FedEx, DHL, DHL Global Mail, Fastway, UPS Mail Innovations, Lasership, Royal Mail, FedEx SmartPost, OSM, OnTrac, Streamlite, Newgistics, Canada Post, City Link, GLS, GO!, Hermes Logistik Gruppe, Parcelforce, TNT, Target, SagawaExpress, NipponExpress, YamatoTransport, Other
```

I really don't fancy wrapping each element of this list with quotes one by one, there must be a better way!

There is, you can use the regex replace functionality of PHPStorm to do this for you quickly and easily.

First of all paste the string into your PHPStorm editor and highlight it. Then hit ``[ctrl]+[r]`` to start your find and replace.

The "In Selection" tick box should be ticked already, you also need to tick the regex box.

Then in the find section, use this regex:
```
( |)([^,]+),
```

And in your replace box, put this:

```
\n'$2',
```

This gets you nearly all the way there, you might just need to tidy up a bit you should now have something looking like this:

```
'Blue Package',
'USPS',
'UPS',
'UPSMI',
'FedEx',
'DHL',
'DHL Global Mail',
'Fastway',
'UPS Mail Innovations',
'Lasership',
'Royal Mail',
'FedEx SmartPost',
'OSM',
'OnTrac',
'Streamlite',
'Newgistics',
'Canada Post',
'City Link',
'GLS',
'GO!',
'Hermes Logistik Gruppe',
'Parcelforce',
'TNT',
'Target',
'SagawaExpress',
'NipponExpress',
'YamatoTransport', Other
```

The ``Other`` on the end has not been converted has it doesn't have a trailing comma. You could mess about with yoru regex trying to get this to also be converted, or you could say good enough and move on.

