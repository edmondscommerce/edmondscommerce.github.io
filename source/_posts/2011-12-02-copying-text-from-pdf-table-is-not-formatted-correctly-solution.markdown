---
layout: post
status: publish
published: true
title: Copying Text from PDF table is not formatted correctly + solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2747
wordpress_url: http://www.edmondscommerce.co.uk/?p=2747
date: 2011-12-02 17:41:53.000000000 +00:00
categories:
- ubuntu
tags:
- linux
- table
- solution
- pdf
- tip
- text
- extract
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you need to extract the information from a PDF table sometimes when you copy and paste it into a text editor the formatting is incorrect making the information useless.

In cases like this, you can use pdfedit to extract the text in the correct formatting and then do what you need with it.

To use the program first make sure it's installed. If not install it like this 

<code>
sudo apt-get install pdfedit
</code>

then use it to open the PDF. Click through the the correct page and then click Page -> Extract Text From Page
