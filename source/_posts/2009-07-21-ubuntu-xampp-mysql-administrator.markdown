---
layout: post
status: publish
published: true
title: Ubuntu Xampp MySQL Administrator
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1118
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1118
date: 2009-07-21 12:00:21.000000000 +01:00
categories:
- mysql
tags:
- mysql
- ubuntu
- xampp
- mysql administrator
- mysql query browser
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are using XAMPP on Ubuntu (or probably other) Linux and are also trying to use the MySQL Administrator and MySQL Query Browser GUI tools available in the repo's, you have probably hit an error message like this:

```

Could not connect to host 'localhost'.
MySQL Error Nr. 2002
Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

```

A nice quick fix for this one. In the terminal run the following two commands and then you should be able to connect fine using localhost as the host and the configured MySQL username and password, probably root and {password}.

```

sudo mkdir /var/run/mysqld/

```

```

sudo ln -s /opt/lampp/var/mysql/mysql.sock /var/run/mysqld/mysqld.sock

```

