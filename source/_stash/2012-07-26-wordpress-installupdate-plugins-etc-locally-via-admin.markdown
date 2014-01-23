---
layout: post
status: publish
published: true
title: Wordpress Install/Update Plugins etc Locally via Admin
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3188
wordpress_url: http://www.edmondscommerce.co.uk/?p=3188
date: 2012-07-26 15:42:00.000000000 +01:00
categories:
- wordpress
tags:
- ssh
- wordpress
- admin
- update
- ftp
---
If you like the admin functionality to manage plugins, themes and other updates that wordpress features and would like to have this working when you are developing locally then you might find that you need to set up an FTP server locally just for this purpose.

Perhaps a better solution, especially if you use a *nix based desktop such as Linux is to try this extension:

<a href="http://wordpress.org/extend/plugins/ssh-sftp-updater-support/">http://wordpress.org/extend/plugins/ssh-sftp-updater-support/</a>

This will extend the FTP functionality to also use SFTP or SSH for the updates. If you are already running an SSH server on your desktop then there is very little left to do. If you are not then a quick 

```

sudo apt-get install openssh-server

```

And you are ready to go.

From this point you can then use the admin functionality to manage plugins etc which is a nice slick way of doing things.
