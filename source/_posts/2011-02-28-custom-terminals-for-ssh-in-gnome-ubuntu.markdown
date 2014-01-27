---
layout: post
status: publish
published: true
title: Custom Terminals for SSH in Gnome Ubuntu
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2156
wordpress_url: http://www.edmondscommerce.co.uk/?p=2156
date: 2011-02-28 18:07:52.000000000 +00:00
categories:
- ubuntu
tags:
- ubuntu
- custom
- ssh
- terminal
- gnome
- profile
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you manage a few servers, you might often find yourself with a few terminal windows open and it can get tricky to remember which terminal window is which.

To make this a lot easier you can create a custom terminal launcher for your panel and make it use a custom terminal colour scheme and profile and also make it automatically log into the server in question via SSH so it really is either that server or nothing (unless you exit but keep the terminal window open for some reason).

For your production server for example you might do the following:

Open up a terminal and create a new profile by selecting Edit->Profiles then hit the ```new
 button and create a profile called "Production". Customise it to suit.

To create a new launcher, right click your panel and select "Add to Panel"

Then click "Custom Application Launcher"

For the name, call it something obvious like "Production"

The command should be like this:

[code]
gnome-terminal --window-with-profile=Production --command="ssh username@server.com"

```

Now choose a nice icon by clicking the springy icon that is default and navigate around till you find one you like.

Save the launcher and try clicking it, it should automatically use the special colour scheme you set and should also either log you straight into SSH (if you are using SSH Keys) or will give you the password prompt.

Never be confused again!
