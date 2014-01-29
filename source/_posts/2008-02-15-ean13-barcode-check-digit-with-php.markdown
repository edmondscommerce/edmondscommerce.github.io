---
layout: post
status: publish
published: true
title: EAN13 Barcode Check Digit with PHP
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 13
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/ean13-barcode-check-digit-with-php/
date: 2008-02-15 15:10:51.000000000 +00:00
categories:
- php
- barcode
tags:
- php
- function
- ean13
- barcode
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
EAN13 is a barcode format. It consists of 12 numbers which you will generally have a range assigned to you. The 13th digit is called the check digit and is formulated by loooking at the other 12 digits. The purpose of the check digit is to ensure that the number is being read correctly as if any of the numbers do not match up, the check digit will not validate.

If you need to create check digits in PHP, here is my handy function:

```php


function ean13_check_digit($digits){
//first change digits to a string so that we can access individual numbers
$digits =(string)$digits;
// 1. Add the values of the digits in the even-numbered positions: 2, 4, 6, etc.
$even_sum = $digits{1} + $digits{3} + $digits{5} + $digits{7} + $digits{9} + $digits{11};
// 2. Multiply this result by 3.
$even_sum_three = $even_sum * 3;
// 3. Add the values of the digits in the odd-numbered positions: 1, 3, 5, etc.
$odd_sum = $digits{0} + $digits{2} + $digits{4} + $digits{6} + $digits{8} + $digits{10};
// 4. Sum the results of steps 2 and 3.
$total_sum = $even_sum_three + $odd_sum;
// 5. The check character is the smallest number which, when added to the result in step 4,  produces a multiple of 10.
$next_ten = (ceil($total_sum/10))*10;
$check_digit = $next_ten - $total_sum;
return $digits . $check_digit;
}

```

Other Barcode Related Resources:

<a href="http://phpclasses.fonant.com/browse/package/3643.html" rel="nofollow">http://phpclasses.fonant.com/browse/package/3643.html</a>

<a href="http://thinkabdul.com/2007/01/04/barcoder-freeware-ean-13-barcode-reader-for-java-j2me-mobiles/" rel="nofollow">http://thinkabdul.com/2007/01/04/barcoder-freeware-ean-13-barcode-reader-for-java-j2me-mobiles/</a>

