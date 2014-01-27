---
layout: post
status: publish
published: true
title: Plesk + Mod Security
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 799
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=799
date: 2009-06-15 09:55:37.000000000 +01:00
categories:
- apache
tags:
- mod_security
- plesk
- apache
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are trying to modify your mod_security configuration on a plesk server and have tried using htaccess files you have probably realised that it won't work. That's a good thing, it makes it harder for people to screw up your server by turning off this protection.

Instead the way to do it is to edit the vhost.conf file located in the conf folder in the domain / sub domain root (the folder containing the httpdocs folder).

You can apply any settings you want to this file and then run the following command to get Plesk to rebuild your httpd configuration including your new settings. This is working with Plesk the way it was intended to be used and is a better solution that the htaccess file approach.

The command to rebuild your Apache configuration when you make a change to the vhost.conf ssl_vhost.conf file is:
```

        /usr/local/psa/admin/bin/websrvmng -a -v

```
This rebuilds the configuration for ALL virtual hosts. It shouldn't take more than a few seconds, obviously you then need to restart Apache.
