---
layout: post
status: publish
published: true
title: Spotify + Ubuntu Linux + Pulseaudio - No Sound + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1708
wordpress_url: http://www.edmondscommerce.co.uk/?p=1708
date: 2010-06-18 10:51:01.000000000 +01:00
categories:
- linux
tags:
- ubuntu
- spotify
- wine
- pulseaudio
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you use Spotify (its awesome I'm a big fan) but don't use one of their chosen operating systems (win/mac) and use Linux instead then you might think its unavailable to you. 

In fact its fairly trivial to get it working.

First - follow the instructions on the spotify website to install Wine and install onto that.

http://www.spotify.com/int/help/faq/wine/

Note though, the instructions don't mention that you have to mark the spotify.exe file as executable before you can install it. (Dead easy, right click, properties, permissions, tick the box for allow executing as a programme).

Once its installed though, you might find that there is no sound. If like me you use Pulse Audio (is this actually standard with Ubuntu now, I'm not sure - I've been using it for a while) then you will need to take this extra step.

1. In the command line, type:
```
 padsp winecfg 
```

This will bring up the Wine configuration controls. Make sure you have ticked the OSS audio driver box.

2. In the Applications menu, go to Wine -> Programs then right click on the Spotify launcher and click "add to panel"

This will then put a Spotify Icon on your panel which is a nice shortcut.

3. On the panel, right click the new shortcut and select properties.

In the command box, you should have something like this:

```

env WINEPREFIX="/home/#####/.wine" wine "C:\Program Files\Spotify\spotify.exe" 

```

You just need to add padsp in front of the wine command, so it should look like this:

```

env WINEPREFIX="/home/#####/.wine" padsp wine "C:\Program Files\Spotify\spotify.exe" 

```
