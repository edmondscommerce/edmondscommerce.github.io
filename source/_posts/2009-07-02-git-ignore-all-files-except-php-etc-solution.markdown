---
layout: post
status: publish
published: true
title: Git Ignore All Files Except PHP etc + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1092
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1092
date: 2009-07-02 09:41:54.000000000 +01:00
categories:
- git
tags:
- git
- version control
- ignore
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Using Git for version control is great, but if like my you work on a lot of different projects then everything you can do to save time setting Git up is well worth it.

One of the features of Git is the ability to only track certain files and ignore other files. For me that means I only want to track files I am likely to be editing and ignore images, flash files and whatever other junk is floating around in a project.

The solution (and all credit and thanks to the kind people on #Git on Freenode IRC) is this .gitignore file. This file will ignore everything except files with the extensions that you set. Dead easy.

```

#ignore everything apart from php, css, xml, htaccess, sql, js
*
!*/
!*.php
!*.css
!*.xml
!*.htaccess
!*.sql
!*.js


```
