---
layout: post
status: publish
published: true
title: osCommerce Password Reset Using phpMyAdmin
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 46
wordpress_url: http://www.edmondscommerce.co.uk/blog/oscommerce/oscommerce-password-reset-using-phpmyadmin/
date: 2008-05-06 15:53:08.000000000 +01:00
categories:
- oscommerce
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Sometimes you need to get in there and reset the password for oscommerce using phpMyAdmin.

In these instances, you do not just paste in a new password but you have to properly encode it first.

Here is a really handy tool to create a password hash for you, ready to be pasted into phpMyAdmin

for the admin side, you will need to edit the admin table and paste this into the password field for the account you need to set the password for.

<a href="http://www.oscommercecustomsolutions.com/os-commerce/modules/2008/ive-lost-my-oscommerce-password-i-cant-login-to-oscommerce/">Check out this easy oscommerce password generator</a>
