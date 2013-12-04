---
layout: post
status: publish
published: true
title: Debugging Programmatically Opened Terminals in Gnome
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2740
wordpress_url: http://www.edmondscommerce.co.uk/?p=2740
date: 2011-11-30 13:59:21.000000000 +00:00
categories:
- linux
tags:
- ubuntu
- linux
- error
- solution
- bash
- terminal
- gnome
- open
- scripting
- launcher
- hold
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are building something that is opening a terminal, perhaps a fancy URL handler or something similar but there are errors causing the terminal to instantly close, then this is the solution for you. 

It's actually really simple!

Create a new profile

Select the "Title and Command" tab

at the bottom there is an option "when command exits"

You can switch this to "Hold Terminal Open" which will keep the terminal open so you can see the error message and then fix it

You need to add the following flag to your gnome-terminal launcher:

```

gnome_terminal --window-with-profile={profile_name}

```

Beautiful!
