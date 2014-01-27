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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
