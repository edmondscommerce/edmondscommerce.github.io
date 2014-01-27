---
layout: post
status: publish
published: true
title: Quickly make a deploy folder from git
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2728
wordpress_url: http://www.edmondscommerce.co.uk/?p=2728
date: 2011-11-14 17:31:00.000000000 +00:00
categories:
- git
tags:
- git
- bash
- live deployment
- one-liners
- helpful tips
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I needed to quickly generate a deploy folder that included all changes in the last two weeks. Using git and a little bit of bash magic I was able to put together a one liner to do this.

This works we use a public folder within our git structure which makes filtering the files easy, if you don't have this then you will have to change the grep filter to match your needs. Obviously you can change the since filter to get the files you need.

<code>git log --since="2 weeks ago" --name-status | grep public | sort | uniq | awk '{print $2}' | xargs -I % cp --parents % /path/to/deploy</code>

Hope this helps in the future
