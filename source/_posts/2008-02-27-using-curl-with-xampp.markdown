---
layout: post
status: publish
published: true
title: Using cURL with XAMPP
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 22
wordpress_url: http://www.edmondscommerce.co.uk/blog/curl/using-curl-with-xampp/
date: 2008-02-27 11:36:51.000000000 +00:00
categories:
- curl
- xampp
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you have read through this blog, you will realise that I am a big fan of the cURL library for PHP. Also, when using windows to code - I like to use the XAMPP package to give me easy access to an Apache, PHP and MySQL stack.

So here is my quick guide to getting XAMPP to work with cURL. Its really easy:

1. Navigate to your root XAMPP folder

2. Search for all files and folder with this search query: php*.ini

3. Open up all of the files in your favourite windows text editor (try notepad++)

4. Do a find and replace:  Find <em>;extension=php_curl.dll </em>and replace with<em> extension=php_curl.dll </em>(you are just removing the semi colon). Make sure you select to replace in all opened documents

5. File -&gt; Save All Documents

6. Restart Apache using the XAMPP control panel

Thats it - enjoy using cURL.

