---
layout: post
status: publish
published: true
title: Wordpress Bash Install Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1866
wordpress_url: http://www.edmondscommerce.co.uk/?p=1866
date: 2010-10-25 11:58:11.000000000 +01:00
categories:
- wordpress
tags:
- wordpress
- bash
- install
- sh
- script
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Easy peasy:

```

#!/bin/bash
wget http://wordpress.org/latest.zip
unzip latest.zip
cp -rf ./wordpress/* ./

```

handy little bash script to install word press
