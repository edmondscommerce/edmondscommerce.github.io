---
layout: post
status: publish
published: true
title: Spotify Links Working in Linux
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1717
wordpress_url: http://www.edmondscommerce.co.uk/?p=1717
date: 2010-06-19 09:41:09.000000000 +01:00
categories:
- linux
tags:
- firefox
- ubuntu
- linux
- spotify
- spotify links
- playlists
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
<b>Update:</b>

if you have installed the native Linux client, just run these three commands in the terminal:

```

gconftool-2 -t string -s /desktop/gnome/url-handlers/spotify/command "/usr/bin/spotify -uri %s"
gconftool-2 -t bool -s /desktop/gnome/url-handlers/spotify/needs_terminal false
gconftool-2 -t bool -s /desktop/gnome/url-handlers/spotify/enabled true

```

--------

To get spotify links (eg playlist links etc) to work in Linux, I found that this solution worked for me:

First you need to create a shell script that will launch spotify for you. Here is the contents of that script:

```

#!/bin/bash

padsp wine  "$HOME/.wine/drive_c/Program Files/Spotify/spotify.exe" /uri "$@"

```

I save the script as spotify.sh, then I set the permissions to executable in Nautilus.

Note the padsp - if you use Pulse Audio, you need this bit, If you don't then you can remove it. If you try it one way and it doesn't work try it the other way.

Once that's done there are two things you can try.

The first (which seemed to be what worked for me) is to run the following three commands in the command line.

```

gconftool-2 -t string -s /desktop/gnome/url-handlers/spotify/command "/home/${USER}/spotify.sh %s"
gconftool-2 -s /desktop/gnome/url-handlers/spotify/needs_terminal false -t bool
gconftool-2 -s /desktop/gnome/url-handlers/spotify/enabled true -t bool

```

I also did the following first, though it didn't seem to work on it's own. I'm not sure if it is required or not:

In Firefox, go to about:config then you need to add three new config settings (by right clicking in the main area and selecting 'New').

Type: string
Name: network.protocol-handler.app.spotify
Value: /home/#####/spotify.sh

Type: boolean
Name: network.protocol-handler.external.spotify
Value: true 

Type: boolean
Name: network.protocol-handler.expose.spotify
Value: false 

