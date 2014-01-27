---
layout: post
status: publish
published: true
title: 'PHP: Recursive Create Path (if not exists)'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 66
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-recursive-create-path-if-not-exists/
date: 2008-07-31 15:11:08.000000000 +01:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Handling directories and files with PHP is a snap. However, with this handy function you can always be sure that the destination directory path for your files will exist.

If you pass a path with a filename at teh end, set the second parameter to true eg make_path($path, true)

```php

/*Create  Directory Tree if Not Exists
If you are passing a path with a filename on the end, pass true as the second parameter to snip it off */
function make_path($pathname, $is_filename=false){

	if($is_filename){

		$pathname = substr($pathname, 0, strrpos($pathname, '/'));

	}

    // Check if directory already exists

    if (is_dir($pathname) || empty($pathname)) {

        return true;

    } 

    // Ensure a file does not already exist with the same name

    $pathname = str_replace(array('/', '\\'), DIRECTORY_SEPARATOR, $pathname);

    if (is_file($pathname)) {

        trigger_error('mkdirr() File exists', E_USER_WARNING);

        return false;

    } 

    // Crawl up the directory tree

    $next_pathname = substr($pathname, 0, strrpos($pathname, DIRECTORY_SEPARATOR));

    if (make_path($next_pathname, $mode)) {

        if (!file_exists($pathname)) {

            return mkdir($pathname, $mode);

        }

    } 

    return false;

}

```
