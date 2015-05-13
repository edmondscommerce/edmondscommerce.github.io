---
layout: post
title: "PHP json_encode Failing with No Clear Reason + Solution"
date: 2015-05-13 13:05:35 +0100
comments: true
author: joseph
categories: php
tags: 
 - php
 - json_encode
 - php 5.6
description: "If you are having issues with json_encode not working for no apparent reason, this might be a solution for you"
---

I recently had an issue on a server that has been updated to use PHP 5.6. Code that was using json_encode had stopped working for no apparent reason.

Reading into the issue, it seems that one scenario that this would happen is if the strings in an array were not valid utf8. An obvious solution to this was to encode the strings.

Here is a simple function to process an array ready for use with json_encode. It solved the issue for me, maybe it can help you too?

``` php

/**
 * Process an array and utf8 encode all leaf elements ready for json encode
 * @param array &$arr - reference to an array to process
 */
function utf8_array_for_json(array &$arr){
    array_walk_recursive($arr, function(&$valByRef){$valByRef = utf8_encode($valByRef);});
}

```

To use this, simply pass in your array (by reference) before calling json_encode on the array, for example:

``` php

utf8_array_for_json($myArray);
echo json_encode($myArray);

```
