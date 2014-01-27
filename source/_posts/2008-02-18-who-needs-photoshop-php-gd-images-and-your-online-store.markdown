---
layout: post
status: publish
published: true
title: Who Needs Photoshop? PHP GD Images and Your Online Store
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 15
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/who-needs-photoshop-php-gd-images-and-your-online-store/
date: 2008-02-18 14:34:55.000000000 +00:00
categories:
- php
- programming
- gd
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Many web masters will be familiar with Photoshop by Adobe. This highly featured photo editing and graphics application is incredibly powerful, but also incredibly expensive. If you find that the main thing you do with photoshop is basic product image cropping, resizing, trimming, rotating and watermarking then there is a better way!

If your server uses PHP and has GD functionality enabled, you can use the power of the GD library to automatically do all of these things for you. Furthermore the GD library is faster than using photoshop and as the process actually runs on your server, you do not have to worry about uploading files. Your employees can directly manipulate product photos from your web store administration screens.

Chances are the main thing you will need to do is to take one hi res source image and create one or more resized versions of it to be displayed as thumbnails or product info page images. Your Hi Res images can then be displayed as a pop up or lightbox.

There are many PHP GD thumbnail classes etc out there and you will easily find one by searching the major search engines.

Here are the basic concepts though:

<strong>1. Grab an image into memory from an external jpeg file</strong>
Before we can do anything we have to get an image into the memory. This then gives us something to work with.
```php

//grab image into memory,  $img = full url to jpeg image
if(!$jpeg = imagecreatefromjpeg($img)){
echo '
<h2 style="color: red">Failed to Grab Image ' . $img . '</h2>
';
exit;
}

```

<strong>2. Manipulate Image however you want</strong>
There are all kinds of things you can do with the image you have loaded using the GD library.

<strong>3. Display the Image or Save to Disk</strong>
Once you have manipulated the image and have it looking the way you want, you can either serve it up or save it to the disk. Of course you can also do both if you prefer.
```php

//save image
$save_path = 'Your Save Path';
imagejpeg($jpeg,$save_path);

//display image
header ("Content-Type: image/jpeg");
imagejpeg($jpeg);

//destroy image to free memory
imagedestroy($jpeg);

```

<strong>Related Resources</strong>
<a href="http://uk3.php.net/gd" rel="nofollow">http://uk3.php.net/gd</a>
<a href="http://www.phpclasses.org/browse/package/1365.html" rel="nofollow">http://www.phpclasses.org/browse/package/1365.html</a>
<a href="http://www.phpit.net/article/image-manipulation-php-gd-part1/" rel="nofollow">http://www.phpit.net/article/image-manipulation-php-gd-part1/</a>
