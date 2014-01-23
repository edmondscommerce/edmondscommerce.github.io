---
layout: post
status: publish
published: true
title: Bash Terminal Rename Programmatically
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3864
wordpress_url: http://www.edmondscommerce.co.uk/?p=3864
date: 2013-01-16 12:56:15.000000000 +00:00
categories:
- bash
tags:
- function
- linux
- custom
- bash
- terminal
- change
- tip
- window
- title
---
If you have a load of terminals open you might find it handy to be able to rename the window title on the fly.

You can do this easily by copying this code into your ~/.bashrc file (or even pasting it into your terminal if you like)

```bash

function nameTerminal() {
    [ &quot;${TERM:0:5}&quot; = &quot;xterm&quot; ]   &amp;&amp; local ansiNrTab=0
    [ &quot;$TERM&quot;       = &quot;rxvt&quot; ]    &amp;&amp; local ansiNrTab=61
    [ &quot;$TERM&quot;       = &quot;konsole&quot; ] &amp;&amp; local ansiNrTab=30 ansiNrWindow=0
        # Change tab title
    [ $ansiNrTab ] &amp;&amp; echo -n $'\e'&quot;]$ansiNrTab;$1&quot;$'\a'
        # If terminal support separate window title, change window title as well
    [ $ansiNrWindow -a &quot;$2&quot; ] &amp;&amp; echo -n $'\e'&quot;]$ansiNrWindow;$2&quot;$'\a'
}

```

If you have pasted this into your ~/.bashrc file you need to launch a new terminal or run:

```bash

source ~/.bashrc

```

From this point the function is now ready to use and you can run:

```bash

nameTerminal &quot;My Custom Terminal Window Title&quot;

```

Now you can easily choose the terminal you want based upon the window title.

Of course this then opens the door to automatically changing the window title based on all kinds of events that you might like, isn't bash scripting fun!
