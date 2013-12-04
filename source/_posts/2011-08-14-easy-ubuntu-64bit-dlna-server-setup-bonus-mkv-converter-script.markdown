---
layout: post
status: publish
published: true
title: Easy Ubuntu 64bit DLNA Server Setup + Bonus MKV Converter Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2576
wordpress_url: http://www.edmondscommerce.co.uk/?p=2576
date: 2011-08-14 15:01:23.000000000 +01:00
categories:
- linux
tags:
- ubuntu
- server
- dlna
- mkv
- mp4
- tvmobili
- avidemux
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are trying to get your computer and TV talking to each other over your home network so you can directly play files on the TV over the network then this is for you.

Windows 7 has DLNA built in and initially I was booting into that for DLNA services, but the behaviour is really weird and basically broken, its tightly integrated into media player and trying to figure out how to make it recognise newly added files was infuriating and not fruitful.

So boot into Ubuntu linux 10.10 64 bit, my favoured desktop which doesn't feature DLNA as standard but being linux has various options for doing it. 

After messing about with a few different packages I came across TVMOBili. It is not natively 64bit but its easy enough to install the 32bit version. Once installed, setting it up is a breeze so install to watching on TV is less than 5 mins.

You need ia32 installed to allow you to run 32 bit apps, so do that first.

```

sudo apt-get install ia32-libs

```

Then download the dot deb package

To install, use this command - replacing the deb bit with the correct filename:

```

sudo dpkg -i --force-architecture tvMobiliInstall_debian.deb

```

Once installed, you can access the web interface on <a href="http://localhost:30888">http://localhost:30888</a>

From here you can control which directories are shared.

You should now be able to detect the share from your TV. It may take a couple of minutes to show up in the list of devices available. 

Once caveat is that it does seem to show unsupported files (eg .mkv) but playback doesn't seem to work. Easy solution here is to convert to a supported format.

Don't start transcoding (slow and heavy process). Instead you can demux into MP4 (basically just change the container but leave the actual audio/video streams as they are).

To do this there is a great app called AviDemux

Check out this little bash script. Suggest you create a folder in your home directory called bin

```

mkdir ~/bin

```

Then run 
```

nohup gedit ~/bin/mkconv

```

Into that paste this:
```

#!/bin/bash
# this script is to batch convert MKV files to MP4 within the current folder
for video in *mkv;
do 
	avidemux \
	--video-codec COPY \
	--force-alt-h264 \
	--load "$video" \
	--output-format	MP4 \
	--save "${video%.mkv}.mp4" \
	--quit;
done

```

save and close the file

then run this command to make it executable:

```

chmod +x ~/bin/mkconv

```

You may need to log out and in again at this point.

Now browse to a folder containing mkv files and open it in the terminal

<a href="http://www.edmondscommerce.co.uk/ubuntu/ubuntu-nautilus-open-terminal-here/">Note this nautilus extension makes this a breeze</a>

Then simply type mkconv and hit return

This should loop through the files and create mp4 copies of all your MKV files. On my fairly beefy laptop it takes a matter of minutes to convert a few GBs of files

Hope this helps ;)
