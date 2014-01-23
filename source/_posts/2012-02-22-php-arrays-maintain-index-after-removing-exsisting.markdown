---
layout: post
status: publish
published: true
title: PHP Arrays Maintain Index After Removing Exsisting
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2950
wordpress_url: http://www.edmondscommerce.co.uk/?p=2950
date: 2012-02-22 14:57:41.000000000 +00:00
categories:
- php
tags:
- php
- index
- arrays
- quirk
---
One of the features that makes PHP such a powerful language is it's arrays. They allow for really complex data structures to be stored and worked on really easy. One interesting aspect of them is that they maintain there index if emptied one element at a time.

Taken from php.net: <a href="http://php.net/manual/en/language.types.array.php">http://php.net/manual/en/language.types.array.php</a>

```php

<?php
// Create a simple array.
$array = array(1, 2, 3, 4, 5);
print_r($array);

// Now delete every item, but leave the array itself intact:
foreach ($array as $i => $value) {
    unset($array[$i]);
}
print_r($array);

// Append an item (note that the new key is 5, instead of 0).
$array[] = 6;
print_r($array);

// Re-index:
$array = array_values($array);
$array[] = 7;
print_r($array);
?>

```

Will output:
```
Array
(
    [0] => 1
    [1] => 2
    [2] => 3
    [3] => 4
    [4] => 5
)
Array
(
)
Array
(
    [5] => 6
)
Array
(
    [0] => 6
    [1] => 7
)

```
