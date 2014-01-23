---
layout: post
status: publish
published: true
title: Ubuntu Restore Gnome Panels Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1622
wordpress_url: http://www.edmondscommerce.co.uk/?p=1622
date: 2010-05-05 09:19:39.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- gnome
- panel
- restore
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If your ubuntu panels go wonky check out this little script courtesy of http://bithacker.posterous.com:

```

#!/bin/sh
#
# GNOME Panel Save / Restore
# Writen by PhrankDaChicken
#
# http://ubuntu.online02.com
#
#
# Updated to add restore defaults by jimjimovich
# http://www.starryhope.com
#
#


DIR=$(pwd)
TITLE="PanelRestore"

Main () {
	CHOICE=$(zenity --list --title "$TITLE" --hide-column 1 --text "What do you want to do?" --column "" --column "" \
"0" "Save Panel Settings" \
"1" "Restore Panel Settings" \
"2" "Restore Default Panel Settings")
	if [ $CHOICE = 0 ]; then
		Panel_Save
	fi
	if [ $CHOICE = 1 ]; then
		Panel_Restore
	fi
	if [ $CHOICE = 2 ]; then
		Panel_Defaults
	fi	
}

Panel_Restore () {
	FILE=$(zenity --title "$TITLE: Open File" --file-selection --file-filter "*.xml" )
	if [ -n "$FILE" ]; then 
		gconftool-2 --load "$FILE"
		killall gnome-panel
	fi
	Main
}

Panel_Save () {
	FILE=$(zenity --title "$TITLE: Save File" --file-selection --save --confirm-overwrite --filename "Gnome_Panel.xml" --file-filter "*.xml" )
	if [ -n "$FILE" ]; then 
		EXT=$(echo "$FILE" | grep "xml")
		if [ "$EXT" = "" ]; then
			FILE="$FILE.xml"
		fi
		gconftool-2 --dump /apps/panel > $FILE
		zenity --info --title "$TITLE: File Saved" --text "File saved as: \n $FILE"
	fi
	Main
}

Panel_Defaults () {
	zenity --question --text="Are you sure you want to restore the default top and bottom panels?"
	gconftool-2 --recursive-unset /apps/panel
	rm -rf ~/.gconf/apps/panel
	pkill gnome-panel
	exit
}

Main

# END OF Script

```

create a file called PanelRestore.sh, paste these contents into it and save and then make the file executable and run it.

life saver!
