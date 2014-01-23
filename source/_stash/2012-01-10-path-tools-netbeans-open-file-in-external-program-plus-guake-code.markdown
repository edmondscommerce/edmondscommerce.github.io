---
layout: post
status: publish
published: true
title: Path Tools Netbeans Open File in external program plus guake code
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2826
wordpress_url: http://www.edmondscommerce.co.uk/?p=2826
date: 2012-01-10 16:30:14.000000000 +00:00
categories:
- ubuntu
tags:
- development
- linux
- desktop
- netbeans
- bash
- tip
---
Not many people are aware of the Path Tools extension for netbeans, and even fewer know how to make it really useful.

Effectively it provides 4 buttons - Copy Path, Open Folder, Open Terminal and Edit Path, the latter three being configurable.

Its default for Open Folder is great (for gnome users) but that's the only one that has a default.

I use Guake (a pull-down transparent terminal) and for the two options (For Folder and For File) I set to the following for a nice "New tab in guake" :-
```
guake --new-tab "{path}" -t
```
and
```
guake --new-tab "{parent-path}" -t
```

And for the "Edit Path" button, I find it extremely useful to create a "run external program" script - sat in my personal bin directory ($HOME/bin/) containing the following code :-
```
#!/bin/bash

ESCAPEDPARAMS=`echo $* | sed -e 's/\([[\/.*]\|\]\)/\\\&/g'`
MIME=`file --mime-type $* | cut -f2 -d: | cut -f2 -d' '`
DESKTOPFILE=/usr/share/applications/`xdg-mime query default $MIME`
EXEC=`grep '^Exec=' $DESKTOPFILE | cut -f2 -d=`
COMMAND=`zenity --width 600 --entry --title="Path Tools" --text="Run Command : " --entry-text="$(echo $EXEC | sed s/'%U'/"$ESCAPEDPARAMS"/)"` 

if [ "$?"=="0" ]; then
  sh -c "$COMMAND"
else
  echo ""
fi
```
and set that up as the command "For Folder" and "For File" with {path} for both (not {parent-path} notice).

So, what does it do?

<ul>
	<li>MIME variable is set to the mime-type of the file (e.g. image/jpeg)</li>
	<li>DESKTOPFILE is set to the .desktop file that is associated with that mime-type (for my gnome setup this is /usr/share/applications/${DESKTOPFILE} )</li>
	<li>EXEC is the command contained within that desktop file</li>
	<li>COMMAND uses zenity to prompt for the commandline I want to run, pre-populated with the gnome default</li>
</ul>

This means when I press the "Edit Path" button on a JPeg file, a popup asks for a commandline, prepopulated with my defaults (in this instance "eog /path/to/file.jpg") and if I want I can change the command to gimp.  If I click OK in the box, the command is run.  If I just wanted to see the full path, I can maximise the box, look at it and click Cancel.
