---
layout: post
status: publish
published: true
title: Install Native Spotify Client in Ubuntu
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1743
wordpress_url: http://www.edmondscommerce.co.uk/?p=1743
date: 2010-07-22 14:10:44.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- spotify
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Spotify have brought out a native Linux client (finally!) and I can report that it works great.

However, the <a href="http://www.spotify.com/uk/download/previews/">installation instructions</a> are a little sparse - here are some easier ones:

First you need to add the spotify repository. Here are some proper instructions on how to add repositories:
<a href="http://ubuntuguide.org/wiki/Ubuntu:Lucid#Add_Extra_Repositories">http://ubuntuguide.org/wiki/Ubuntu:Lucid#Add_Extra_Repositories
</a>

Basically though, you need to edit (as sudo) this file: /etc/apt/sources.list

```

sudo gedit /etc/apt/sources.list

```

at the bottom of the file paste in this line and save the file:
```

deb http://repository.spotify.com stable non-free

```

Now open a terminal window (applications, accessories, terminal) and run the following:
```

gpg --keyserver wwwkeys.de.pgp.net --recv-keys 4E9CFF4E

```
```

gpg --export 4E9CFF4E |sudo apt-key add -

```
```

apt-get update

```
```

apt-get install spotify-client-qt spotify-client-gnome-support

```

That installs it, but as far as I could tell nothing is added to the menu. You can actually launch the app by opening a terminal and simply running:
```

spotify

```

You might decide to manually <a href="http://www.ubuntugeek.com/howto-add-entries-in-gnome-menu.html">add this to the menu</a> or create a <a href="https://help.ubuntu.com/7.04/user-guide/C/launchers.html">custom launcher in your panel</a>
